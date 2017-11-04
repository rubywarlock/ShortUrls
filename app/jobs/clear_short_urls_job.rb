class ClearShortUrlsJob < ApplicationJob
  #queue_as :default

  def perform(urls)
    urls.destroy_all
  end
end

ClearShortUrlsJob.set(wait: 1.minute).perform_later(ShortUrl.where('created_at >= ?', true, 1.minute.ago))