class GroupController < ApplicationController
  def accept
    @gj = GroupJoin.where(group_id: params[:id].to_i, user_id: current_user.id).first
    @gj.status = 1
    @gj.save
    redirect_to root_path
  end
  def denial
    @gj = GroupJoin.where(group_id: params[:id].to_i, user_id: current_user.id).first
    @gj.destroy
    redirect_to root_path
  end
  def destroy
    @gj = GroupJoin.where(group_id: params[:post_id].to_i, user_id: current_user.id).first
    @gj.destroy
    redirect_to root_path
  end
  def accept
    @gj = GroupJoin.where(group_id: params[:post_id].to_i, user_id: current_user.id).first
    @gj.status = 1
    @gj.save
    redirect_to root_path
  end
end
