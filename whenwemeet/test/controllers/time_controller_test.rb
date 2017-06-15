require 'test_helper'

class TimeControllerTest < ActionDispatch::IntegrationTest
  test "should get save" do
    get time_save_url
    assert_response :success
  end

  test "should get delete" do
    get time_delete_url
    assert_response :success
  end

  test "should get get_personal" do
    get time_get_personal_url
    assert_response :success
  end

  test "should get get_common" do
    get time_get_common_url
    assert_response :success
  end

end
