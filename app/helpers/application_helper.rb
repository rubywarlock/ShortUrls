module ApplicationHelper
  #def is_url_owner?(user_signed_in, current_user)
  def is_url_owner?(short_url)
    user_signed_in? and short_url.user_id == current_user.id
  end
end