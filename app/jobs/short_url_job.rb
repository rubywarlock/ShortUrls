class ShortUrlJob < ApplicationJob
  queue_as :default

  def perform(*res)
    ShortUrl.where('created_at >= ? AND permanent = ?', 1.minute.ago, false).destroy_all
  end
end