class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :run_clean_job

  private
  def run_clean_job
    # ShortUrlJob.set(wait: 1.minute).perform_later
  end
end
