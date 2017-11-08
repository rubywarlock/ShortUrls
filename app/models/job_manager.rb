class JobManager < ApplicationRecord
  def self.job_running?
    where(job_task: "start").present?
  end

  def self.job_stop?
    where(job_task: "stop").present?
  end

  def self.job_exist?
    all().present?
  end

  def self.clear_db
    urls = ShortUrl.where('created_at <= ?', 1.minute.ago)
    urls.destroy_all
    if job_exist?

    end
    unless JobManager.job_stop?
      ShortUrlJob.set(wait: 1.minute).perform_later
    end

    #ShortUrlJob.set(wait: 1.minute).perform_now
  end

  def job_update(status)
    update(job_task: status)
  end
end
