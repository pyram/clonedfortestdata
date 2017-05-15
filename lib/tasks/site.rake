namespace :site do
  desc "Harvest Neubloc job postings from pracuj.pl and store results in the database"
  task scrape_pracuj: :environment do
  	jobcollector = JobCollector.new()
  	jobcollector.collect
  end	

end
