require_relative '../lib/tty-pager'

ENV['PAGER']='less'

pager = TTY::Pager.new
file = File.join(File.dirname(__FILE__), 'temp.txt')
pager.page(File.read(file))
