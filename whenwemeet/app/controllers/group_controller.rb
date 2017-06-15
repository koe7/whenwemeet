class GroupController < ApplicationController
  def accept
    gj = Group.find(group_id: params[:id], user_id: current_user)
    gj.status = 1
    redirect_to root_path
  end
  def denial
    gj = Group.where(group_id: params[:id], user_id: current_user)
    gj.destroy
  end
end
