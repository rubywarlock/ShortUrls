class ShortUrl < ApplicationRecord
  #include ShortUrlConcern
  attr_accessor :status, :code, :error

  belongs_to :user
  before_save :generate_short_url

  validates :original_url, url: true

  validates :user_id, presence: true
  validates :short_url, uniqueness: true, presence: false
  validates :original_url, uniqueness: true, presence: true
  validates_length_of :short_url, maximum: 6
  
  def original
    original_url
  end

  def short
    short_url
  end

  private
  def generate_short_url
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    #self.short_url ||= 6.times.map { chars.sample }.join

    if self.short_url.blank?
      self.short_url = 6.times.map { chars.sample }.join
      #short_url = "#{users_path}/#{half_url}"
    end
  end
end
