module ShortUrlsHelper
  def is_url_owner?(user_signed_in, current_user)
    user_signed_in and user_id == current_user.id
  end
end