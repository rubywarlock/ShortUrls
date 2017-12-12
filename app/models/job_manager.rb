class JobManager < ApplicationRecord
  def self.job_exist?
    all().present?
  end

  def self.clear_db
    urls = ShortUrl.where('created_at <= ?', 1.minute.ago)
    urls.destroy_all
  end

  def job_running?
    self.where(status: "working").present?
  end

  def job_stoped?
    self.where(status: "stopped").present?
  end

  def clean_db
    ShortUrlJob.set(wait: 1.minute).perform_now
  end
end