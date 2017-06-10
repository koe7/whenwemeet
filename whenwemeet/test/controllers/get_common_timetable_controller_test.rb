require 'test_helper'

class GetCommonTimetableControllerTest < ActionDispatch::IntegrationTest
  test "should get time_list" do
    get get_common_timetable_time_list_url
    assert_response :success
  end

end
