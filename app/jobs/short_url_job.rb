class ShortUrlJob < ApplicationJob
  queue_as :default

  def perform()
    ShortUrl.clear_db
  end
end
