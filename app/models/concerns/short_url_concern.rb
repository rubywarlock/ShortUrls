module ShortUrlConcern
	extend ActiveSupport::Concern
	include Rails.application.routes.url_helpers
	require 'net/http'
	
	def check_url
		uri = URI.parse(self.original_url.to_s)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = false
		
		@status = true
		@code = nil
		@error = nil
		
		request = Net::HTTP::Get.new(uri.request_uri)
		
		begin
			puts "============================================================================= ONE"
			puts "code \"#{code}\", status \"#{status}\""
			puts "URI \"#{uri.request_uri}\""
			
			res = http.request(request) rescue false
			
			@code = res.code.to_i
		
		rescue Errno::ECONNRESET => error_message
			@error = error_message
			@status = false
		end
		
		
		if @status == false
			errors.add(:original_url, "This doesn't appear to be an valid site. #{@error.message}")
			return
		end
	end
end