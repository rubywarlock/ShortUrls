class TimeLogJob < ApplicationJob
  #queue_as :default

  def perform()
    # Do something later
    puts Time.now
  end
end