class PagesController < ApplicationController
  def index
     scrape_reddit
  end

  def scrape_reddit
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://www.pracuj.pl/praca/Neubloc;kw"))
    entries = doc.css('.o-list>li.o-list_item')
    @entriesArray = []
     entries.each do |entry|
       title = entry.css('a.o-list_item_link_name')[0].text
       link = 'https://pracuj.pl' + entry.css('a.o-list_item_link_name')[0]['href']
       @entriesArray << Entry.new(title, link)
     end
    #  render template: 'pages/scrape_reddit'
    end

end
