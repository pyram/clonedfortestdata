env :SHELL, '/usr/local/bin/zsh'
env :PATH, '/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin'

set :job_template, nil
job_type :bundle, 'cd :path && bundle exec :task :output'
job_type :command, 'cd :path && :task :output'

every 1.hour do
  rake 'site:scrape_pracuj'
end

every :reboot do
  command "bin/procodile"
end
