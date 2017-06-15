class TimeController < ApplicationController
  def save
    tt = Timetable.new
    tt.begins = params[:begins]
    tt.ends = params[:ends]
    tt.user_id = current_user.id
    redirect_to root_path
  end

  def delete
    tt = Timetable.where(user_id: current_user.id, begins: params[:begins], ends: params[:ends])
    tt.destroy
  end
  def edit
    tt = Timetable.find(id: params[:id])
    tt.begins = params[:begins]
    tt.ends = params[:ends]
    tt.save
    redirect_to root_path
  end
  def get_personal
  end

  def get_common
    groupjoin = GroupJoin.where(group_id: params[:group_id])
    total_tt_list = (0..335).to_a
    common_tt_list = []
    result_list = []
    for row in groupjoin
      tt = Timetable.where(user_id: row.user_id).order('begins ASC')
      for t in tt
        common_tt_list = common_tt_list + (tt.begins..tt.ends).to_a
      end
    end
    common_tt_list = common_tt_list | common_tt_list
    
    if common_tt_list.size != 0
      begins = common_tt_list.first
      ends = begins
      for index in 0..common_tt_list.size-1
        if (common_tt_list[index] + 1) != common_tt_list[index+1]
          ends = common_tt_list[index]
          common_tt = Hash.new
          common_tt.begins = begins
          common_tt.ends = ends
          result_list << common_tt
          begins = common_tt_list[index+1]
        end
      end
    end
    @time_list = result_list
    render "home/index"
  end
end
