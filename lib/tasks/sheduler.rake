desc "This task is called by the Heroku scheduler add-on"
task :clear_short_urls => :environment do
  ShortUrl.where('created_at <= ?', 30.minutes.ago).destroy_all
end