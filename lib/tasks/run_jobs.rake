# require 'jobs/clear_short_urls_job'
# require 'jobs/time_log_job'

# include ClearShortUrlsJob
# include TimeLogJob

namespace :run_jobs do
  task all: :environment do
    # TimeLogJob.set(wait: 1.minute).perform_later


    # ClearShortUrlsJob.set(wait: 1.minute).perform_later(ShortUrl.where('created_at >= ?', 1.minute.ago))

    # ShortUrl.where('created_at >= ?', 1.minute.ago) do |url|
    #  ClearShortUrlsJob.set(wait: 1.minute).perform_async(url)
    # end
  end
end
