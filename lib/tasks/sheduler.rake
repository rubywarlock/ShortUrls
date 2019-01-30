desc "This task is called by the Heroku scheduler add-on"
task :clear_short_urls => :environment do
  ShortUrl.where('created_at <= ? AND permanent == ?', 30.minutes.ago, false).destroy_all
end