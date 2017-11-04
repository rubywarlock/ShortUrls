class ShortUrl < ApplicationRecord
  belongs_to :user

  before_save :generate_short_url
  validate :url_check

  def url_check
    #uri = URI(self.original_url.to_s)
    #request = Faraday.get(uri, {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}})

    uri = URI.parse(self.original_url.to_s)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false

    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)

=begin
    request = Net::HTTP.get_response(uri,{ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, use_ssl: false})
    http = Net::HTTP.new(uri.host)
    http.use_ssl = true
    request = Net::HTTP::Get.new("/yourpath")
    response = http.request(request)
=end
    if res.code.to_i > 400
      errors.add(:original_url, "This doesn't appear to be an valid site.")
    end
  end

  private
  def generate_short_url
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    self.short_url ||= 6.times.map { chars.sample }.join
  end

end
