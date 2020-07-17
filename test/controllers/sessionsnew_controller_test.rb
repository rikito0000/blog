require 'test_helper'

class SessionsnewControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sessionsnew_create_url
    assert_response :success
  end

  test "should get destory" do
    get sessionsnew_destory_url
    assert_response :success
  end

end
