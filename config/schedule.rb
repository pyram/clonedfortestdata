# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, output: { error: 'log/cron_error.log' }
set :environment, 'development'
every 1.hour do
  # command "/usr/bin/some_great_command"
  # runner "MyModel.some_method"
  rake 'site:scrape_pracuj'
end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
