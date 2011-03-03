require 'nokogiri'
require 'open-uri'

countries = Array.new

page = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/List_of_sovereign_states'))
page.css('table tr>td>b>a').each do |link|
  country = Hash.new

  puts "Processing #{link.content}..."
  url = "http://en.wikipedia.org" + link['href']
  country['short_name'] = link.content
  
  begin
    country_page = Nokogiri::HTML(open(url))
    country['official_name'] = country_page.css('span.country-name').first.children.first.content if country_page.css('span.country-name').first
  
    country_page.css('table.infobox tr').each do |info_row|
      th = info_row.css('th').first
      td = info_row.css('td').first
      next unless th and td
      next unless th.css('a').first
      case th.css('a').first.content
        when 'Demonym' then
          country['demonym'] = td.css('a').first ? td.css('a').first.content.split(", ") : td.content.split(", ")
        when 'ISO 3166 code' then
          country['iso_3166_alpha2'] = td.css('a').first.content
        when 'Internet TLD' then
          country['tld'] = td.css('a').first.content
      end
    end
  rescue Exception => err
    country['error'] = true
  ensure
    p country
    countries << country
  end
end

require 'yaml'
y countries