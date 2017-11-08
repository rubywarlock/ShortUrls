class ShortUrl < ApplicationRecord
  include Rails.application.routes.url_helpers
  require 'net/http'

  belongs_to :user
  before_save :generate_short_url
  
  validate :url_check
  validates :user_id, presence: true
  validates :short_url, uniqueness: true, presence: false
  validates :original_url, uniqueness: true, presence: true
  validates_length_of :short_url, maximum: 6

  def url_check
    uri = URI.parse(self.original_url.to_s)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false

    request = Net::HTTP::Get.new(uri.request_uri)
    code = 0
    error = ""
    begin
      res = http.request(request)
      code = res.code.to_i if res.code.to_i > 400
    rescue Errno::ECONNRESET => error
      code = 500
    end



    #if res.code.to_i > 400
    if code > 400
      error_message = "#{error.message}." if error
      errors.add(:original_url, "This doesn't appear to be an valid site. #{error_message}")
    end
  end


  def original
    self.original_url
  end

  def short
    self.short_url
  end

  private
  def generate_short_url
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten


    #self.short_url ||= 6.times.map { chars.sample }.join

    if self.short_url.blank?
      half_url = 6.times.map { chars.sample }.join
      self.short_url = "#{users_path}/#{half_url}"
    end
  end

  def self.clear_db
    where('created_at <= ?', 1.minute.ago).destroy_all
    ShortUrlJob.new(record).enqueue(wait: 1.minute)
  end


end
