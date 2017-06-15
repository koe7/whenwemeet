class TimeController < ApplicationController
  def save
    tt = Timetable.new
    tt.begins = params[:begins].to_i
    tt.ends = params[:ends].to_i
    tt.user_id = current_user.id
    tt.content = params[:content]
    tt.save
    redirect_to root_path
  end

  def delete
    tt = Timetable.where(id: params[:id].to_i).first
    tt.destroy
    redirect_to root_path
  end
  def edit
    tt = Timetable.where(id: params[:id].to_i).first
    tt.begins = params[:begins].to_i
    tt.ends = params[:ends].to_i
    tt.save
    redirect_to root_path
  end
  def get_personal
  end

  def get_common
    groupjoin = GroupJoin.where(group_id: params[:group_id].to_i)
    total_tt_list = (0..335).to_a
    common_tt_list = []
    result_list = []
    for row in groupjoin
      tt = Timetable.where(user_id: row.user_id).order('begins ASC')
      for t in tt
        common_tt_list = common_tt_list + (t.begins..t.ends).to_a
      end
    end
    common_tt_list = common_tt_list | common_tt_list
    
    if common_tt_list.size != 0
      begins = 0
      ends = -1
      if common_tt_list.first != 0
        first_tt = Hash.new
        first_tt['begins'] = 0
        first_tt['ends'] = common_tt_list.first
        first_tt['content'] = "empty"
        result_list << first_tt
      end
      for index in 0..common_tt_list.size-2
        if (common_tt_list[index] + 1) != common_tt_list[index+1]
          common_tt = Hash.new
          common_tt['begins'] = common_tt_list[index] + 1
          common_tt['ends'] = common_tt_list[index+1] - 1
          result_list << common_tt
        end
      end
      last_tt = Hash.new
      last_tt['begins'] = common_tt_list.last + 1
      last_tt['ends'] = 251
      result_list << last_tt
    end
    @time_list = result_list
    render "home/index"
  end
end
