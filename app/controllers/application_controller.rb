class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  TimeLogJob.set(wait: 2.seconds).perform_now


  #ClearShortUrlsJob.set(wait: 1.minute).perform_later(ShortUrl.where('created_at >= ?', 1.minute.ago))

  #ShortUrl.where('created_at >= ?', 1.minute.ago) do |url|
  #  ClearShortUrlsJob.set(wait: 1.minute).perform_async(url)
  #end
end
