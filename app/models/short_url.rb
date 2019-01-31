class ShortUrl < ApplicationRecord
  include ShortUrlsHelper

  belongs_to :user
  before_save :generate_short_url

  scope :shared, -> { where(shared: true) }

  validates :original_url, url: true

  validates :user_id, presence: true
  validates :short_url, uniqueness: true, presence: false
  validates :original_url, uniqueness: true, presence: true
  validates_length_of :short_url, maximum: 12

  def original
    original_url
  end

  def short
    short_url
  end

  private

  def generate_short_url
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    if self.short_url.blank?
      self.short_url = Random.new.rand(6..12).times.map { chars.sample }.join
    end
  end
end
