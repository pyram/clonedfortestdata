class PagesController < ApplicationController
  before_filter :require_pracuj_pl_jobs
  skip_before_filter :only => [:index]

  def index
    #  scrape_pracuj_pl
  end

  def scrape_pracuj_pl
    require 'open-uri'
  # @search_term = 'Neubloc'
  @search_term = 'Neubloc'
  if request.parameters['st']!=NIL
     @search_term = request.parameters['st']
  end
    doc = Nokogiri::HTML(open("https://www.pracuj.pl/praca/" + @search_term + ";kw"))
    # entries = doc.xpath("//span[@itemprop='title']/..")
    entries = doc.xpath('//li[@itemtype=\'http://schema.org/JobPosting\']')
    @entriesArray = []
    entries.each do |entry|
        # location = ''
        locationsArray = []
        entry.xpath('.//a[@itemprop="addressRegion"]').each do |loc|
          locationsArray << Entry.new(loc.text, loc['href'], [])
        end
        title = entry.xpath('.//*[@itemprop="title"]').text
       link = 'https://pracuj.pl' + entry.xpath(".//a[@class='o-list_item_link_name']")[0]['href']
       @entriesArray << Entry.new(title, link, locationsArray)
     end
    #  render template: 'pages/scrape_pracuj_pl'
  end

    private
      def require_pracuj_pl_jobs
        scrape_pracuj_pl
      end
end
