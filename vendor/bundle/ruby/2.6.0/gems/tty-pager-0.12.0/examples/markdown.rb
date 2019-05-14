require 'tty-markdown'
require_relative '../lib/tty-pager'

pager = TTY::Pager.new
file = File.join(__dir__, '../README.md')
text = TTY::Markdown.parse_file(file)
pager.page(text)
