require 'test_helper'

class GroupControllerTest < ActionDispatch::IntegrationTest
  test "should get accept" do
    get group_accept_url
    assert_response :success
  end

  test "should get denial" do
    get group_denial_url
    assert_response :success
  end

end
