class HomeController < ApplicationController
  def index 
	@groups = Group.all
  end

  def popup
	@users = User.all
	
  end

  def groupadd
	group = Group.new
	group.name = params[:groupname]
	group.save
	
	emails = params['invitation']

	group_join=GroupJoin.new
	group_join.user_id = current_user.id
	group_join.group_id = group.id
	group_join.status = 1
	group_join.save	


	for i in 0..emails.length-1
		for user_id in User.where('email=?',emails[i]).ids

			group_join=GroupJoin.new
			group_join.user_id = user_id
			group_join.group_id = group.id
			group_join.status = 0
			group_join.save	

		end
	end

	redirect_to root_path
  end

end
