# lib/job_collector.rb
class JobCollector

  # attr_reader :user, :questions, :answers, :errors

  # def initialize(user)
  #   @user      = user
  #   @questions = user.questions
  #   @answers   = user.answers
  # end

  def collect
  require 'open-uri'
  @search_term = 'Neubloc' + ";kw"
  url_prefix = 'https://pracuj.pl'
  # if request.parameters['st']!=NIL
  #    @search_term = request.parameters['st'] + ";kw"
  # end
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
end