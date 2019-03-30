require 'test_helper'

class UserinfosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userinfos_new_url
    assert_response :success
  end

end
