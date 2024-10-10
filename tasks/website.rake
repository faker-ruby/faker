# frozen_string_literal: true

require 'pathname'

desc 'Generate website files'
task :website_generate do
  txt_files = Pathname.glob('website/**/*.txt') - Pathname.glob('website/version*.txt')
  txt_files.each do |txt|
    html_file = txt.sub_ext('.html')
    sh " ./script/txt2html #{txt} > #{html_file}", verbose: true do |ok, res|
      unless ok
        puts "Failed to generate HTML for #{txt}: #{res}"
        exit 1
      end
    end
  end
end

desc 'Upload website files to rubyforge'
task :website_upload do
  remote_dir = ENV.fetch('REMOTE_DIR', '/var/www/gforge-projects/faker/')
  local_dir = 'website'
  user = ENV.fetch('USER', 'default_user')
  sh "rsync -acCv #{local_dir}/ #{user}@rubyforge.org:#{remote_dir}", verbose: true do |ok, res|
    unless ok
      puts "Failed to upload files: #{res}"
      exit 1
    end
  end
end

desc 'Generate and upload website files'
task website: %i[website_generate website_upload publish_docs]
