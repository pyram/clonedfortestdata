# lib/job_collector.rb
class JobCollector
  def collect
    @url_prefix = 'https://pracuj.pl'
    require 'open-uri'
    Location.delete_all
    Job.delete_all
    scrape_jobs('https://www.pracuj.pl/praca/Neubloc;kw')
  end

  def scrape_jobs(target_url)
    Nokogiri::HTML(open(target_url)).xpath('//li[@itemtype=\'http://schema.org/JobPosting\']').each do |entry|
      new_job = Job.new(name: entry.xpath('.//*[@itemprop="title"]').text, info: @url_prefix + entry.xpath(".//a[@class='o-list_item_link_name']")[0]['href'])
      new_job.save
      scrape_job_locations(entry, new_job)
    end
  end

  def scrape_job_locations(job_entry, new_job)
    job_entry.xpath('.//a[@itemprop="addressRegion"]').each do |loc|
      new_job_location = Location.new(name: loc.text, info: new_job.name, url: @url_prefix + loc['href'], job_id: new_job.id)
      new_job_location.save
    end
  end
end
