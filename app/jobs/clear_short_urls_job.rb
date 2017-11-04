class ClearShortUrlsJob < ApplicationJob
  #queue_as :default

  def perform(urls)
    urls.destroy
  end
end