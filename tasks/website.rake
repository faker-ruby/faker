desc 'Generate website files'
task :website_generate do
  (Dir['website/**/*.txt'] - Dir['website/version*.txt']).each do |txt|
    sh %{ ./script/txt2html #{txt} > #{txt.gsub(/txt$/,'html')} }
  end
end

desc 'Upload website files to rubyforge'
task :website_upload do
  remote_dir = "/var/www/gforge-projects/faker/"
  local_dir = 'website'
  sh %{rsync -acCv #{local_dir}/ #{ENV['USER']}@rubyforge.org:#{remote_dir}}
end

desc 'Generate and upload website files'
task :website => [:website_generate, :website_upload, :publish_docs]
