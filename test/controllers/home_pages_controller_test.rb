require 'test_helper'

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get home_pages_Index_url
    assert_response :success
  end

end
