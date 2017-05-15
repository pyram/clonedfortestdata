namespace :site do
  desc 'Harvest Neubloc job postings from pracuj.pl and store results in the database'
  task scrape_pracuj: :environment do
    log = ActiveSupport::Logger.new('log/scrape_pracuj.log')
    start_time = Time.now

    log.info "Task started at #{start_time}"
    job_collector = JobCollector.new
    job_collector.collect

    jobs_count = Job.count
    locations_count = Location.count
    end_time = Time.now
    duration = (start_time - end_time) / 1.minute
    log.info "#{jobs_count}/#{locations_count} - Jobs/Locations total in db"
    log.info "Task finished at #{end_time} and last #{duration} minutes."
    log.close
  end
end
