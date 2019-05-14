# frozen_string_literal: true

require 'net/http'
require 'time'

module RuboCop
  # Common methods and behaviors for dealing with remote config files.
  class RemoteConfig
    attr_reader :uri

    CACHE_LIFETIME = 24 * 60 * 60

    def initialize(url, base_dir)
      @uri = URI.parse(url)
      @base_dir = base_dir
    end

    def file
      return cache_path unless cache_path_expired?

      request do |response|
        next if response.is_a?(Net::HTTPNotModified)
        next if response.is_a?(SocketError)

        File.open cache_path, 'w' do |io|
          io.write response.body
        end
      end

      cache_path
    end

    def inherit_from_remote(file, path)
      new_uri = @uri.dup
      new_uri.path.gsub!(%r{/[^/]*$}, "/#{file}")
      RemoteConfig.new(new_uri.to_s, File.dirname(path))
    end

    private

    def request(uri = @uri, limit = 10, &block)
      raise ArgumentError, 'HTTP redirect too deep' if limit.zero?

      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true if uri.instance_of? URI::HTTPS

      request = Net::HTTP::Get.new(uri.request_uri)
      if cache_path_exists?
        request['If-Modified-Since'] = File.stat(cache_path).mtime.rfc2822
      end

      handle_response(http.request(request), limit, &block)
    rescue SocketError => err
      handle_response(err, limit, &block)
    end

    def handle_response(response, limit, &block)
      case response
      when Net::HTTPSuccess, Net::HTTPNotModified, SocketError
        yield response
      when Net::HTTPRedirection
        request(URI.parse(response['location']), limit - 1, &block)
      else
        begin
          response.error!
        rescue StandardError => e
          raise e, "#{e.message} while downloading remote config file #{uri}"
        end
      end
    end

    def cache_path
      File.expand_path(".rubocop-#{cache_name_from_uri}", @base_dir)
    end

    def cache_path_exists?
      @cache_path_exists ||= File.exist?(cache_path)
    end

    def cache_path_expired?
      return true unless cache_path_exists?

      @cache_path_expired ||= begin
        file_age = (Time.now - File.stat(cache_path).mtime).to_f
        (file_age / CACHE_LIFETIME) > 1
      end
    end

    def cache_name_from_uri
      uri = @uri.clone
      uri.query = nil
      uri.to_s.gsub!(/[^0-9A-Za-z]/, '-')
    end
  end
end
