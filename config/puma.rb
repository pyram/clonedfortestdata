workers Integer(ENV['RAILS_WORKERS'] || 1)
threads_count = Integer(ENV["RAILS_MAX_THREADS"] || 5)
threads threads_count, threads_count

bind        ENV['BIND'] || "tcp://127.0.0.1:3000"
environment ENV.fetch("RAILS_ENV") { "development" }

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
