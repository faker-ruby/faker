# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)

Dir['tasks/**/*.rake'].each { |rake| load rake }

require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Start a console session with Faker loaded'
task :console do
  require 'irb'
  require 'irb/completion'
  require 'faker' # You know what to do.

  ARGV.clear
  IRB.start
end

desc 'Update the ieee\'s oui database'
task :update_oui do
  require 'open-uri'

  db_file = "#{Dir.pwd}/lib/locales/oui.txt"
  db_backup_file = "#{db_file}.save"
  # Backup file before updating
  File.rename(db_file, db_backup_file) if File.exist? db_file

  begin
    URI.open('http://standards-oui.ieee.org/oui/oui.txt') do |db|
      oui_db = File.new(db_file, 'w+')
      # We only want to keep the mac addresses, since the file is huge.
      db.each_line do |line|
        mac_address = line[/[a-fA-F0-9]{2}(-[a-fA-F0-9]{2}){2}/]
        oui_db.write "#{mac_address}\n" unless mac_address.nil?
      end
      oui_db.close
    end
  rescue SocketError => e
    puts "Failed to download oui database: #{e.inspect}"
    # Restore backup file
    # No need to remove db_file since it is in buffered mode, so flushed when closed.
    File.rename(db_backup_file, db_file) if File.exist? db_backup_file
  end

  # At this point, the backup file can be safely removed.
  File.delete(db_backup_file) if File.exist? db_backup_file
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

require 'yard'
YARD::Rake::YardocTask.new

task default: %w[test rubocop]
