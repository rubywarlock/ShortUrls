class ShortUrlJob < ApplicationJob
  queue_as :default

  def perform()
    JobManager.clear_db
  end
end