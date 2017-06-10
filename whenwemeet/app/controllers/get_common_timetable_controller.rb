class GetCommonTimetableController < ApplicationController
  def time_list
    user_ids = params[:ids]
    total_tt_list = (0..195).to_a
    common_tt_list = []
    for tt_user_id in user_ids
      tt_list = []
      timetables = Timetable.where(user_id: tt_user_id).order('begins ASC')
      for tt in timetables
        common_tt_list = common_tt_list + (tt.begins..tt.ends).to_a
      end
      common_tt_list = common_tt_list + tt_list
    end
    common_tt_list = common_tt_list | common_tt_list
    @common_tt_list = total_tt_list - common_tt_list
  end
end
