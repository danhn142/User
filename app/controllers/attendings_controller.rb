class AttendingsController < ApplicationController
	def create
		groups = Group.find(params['group_id'])
		attendings = Attending.create(user: current_user, group: groups)
		redirect_to :back
	end
end
