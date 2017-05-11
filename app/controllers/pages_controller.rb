class PagesController < ApplicationController
  before_filter :require_database_jobs
  skip_before_filter :only => [:index]

  def index
    #  scrape_pracuj_pl
  end

def load_pracuj_pl

    @entriesArray = []
    entries = Job.all()
    entries.each do |entry|
      locationsArray = []
      title = entry.name
      entry.locations.each do |loc|
        locationsArray << Entry.new(loc.name, loc.url, [])
      end
      @entriesArray << Entry.new(title, "", locationsArray)
    end
  end

  def scrape_pracuj_pl
    require 'open-uri'
  @search_term = 'Neubloc' + ";kw"
  url_prefix = 'https://pracuj.pl'
  if request.parameters['st']!=NIL
     @search_term = request.parameters['st'] + ";kw"
  end
    doc = Nokogiri::HTML(open("https://www.pracuj.pl/praca/" + @search_term))

    entries = doc.xpath('//li[@itemtype=\'http://schema.org/JobPosting\']')
    Location.delete_all
    Job.delete_all
    entries.each do |entry|
       title = entry.xpath('.//*[@itemprop="title"]').text
       link = url_prefix + entry.xpath(".//a[@class='o-list_item_link_name']")[0]['href']
       newjob = Job.new(:name => title, :info =>title)
       newjob.save()
       entry.xpath('.//a[@itemprop="addressRegion"]').each do |loc|
          url_link = url_prefix + loc['href']
          newjoblocation = Location.new(:name => loc.text, :info =>title, :url => url_link, :job_id =>newjob.id )
          newjoblocation.save()
        end
     end
  end

    private
      def require_pracuj_pl_jobs
        scrape_pracuj_pl
      end

    private
      def require_database_jobs
        scrape_pracuj_pl
        load_pracuj_pl
      end
end
