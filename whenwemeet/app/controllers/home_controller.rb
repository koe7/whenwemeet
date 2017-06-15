class HomeController < ApplicationController
  def index
    if !current_user.nil?
      tt = Timetable.where(user_id: current_user.id)
      tt_list = []
      for t in tt
        row = Hash.new
        row['content'] = t.content
        row['begins'] = t.begins
        row['ends'] = t.ends
        row['id'] = t.id
        tt_list << row
      end
      @time_list = tt_list
    else
      @time_list = []
    end
  end
end
