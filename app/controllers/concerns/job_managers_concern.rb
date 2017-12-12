module AddonsForJobManagers
  extend ActiveSupport::Concern

  included do
    #attr_reader :month, :contests
    #before_filter :build_month_lists
    #before_filter :set_current_month
    #before_filter :load_contests_for_current_month
  end

  def job_start
    unless JobManager.job_running?
      ShortUrlJob.set(wait: 1.minute).perform_later
      update_status("working")
    end
  end

  def job_stop
    if JobManager.job_running?
      update_status("stopped")
    end
  end

  def update_status(status)
    update(status: status)
  end
end