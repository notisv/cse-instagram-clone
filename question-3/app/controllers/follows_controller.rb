class FollowsController < ApplicationController

	# get the user follows
	def index
		@users = User.all
		@not_current_user = User.where.not(id: current_user)
	end

	# post the user follows
	def create
		# followee means that we follow that user
		@followee = User.find(params[:followee_id])
		# follow functionality
		@follow = Follow.create(follower_id: params[:user_id], followee_id: params[:followee_id])
		
		flash[:notice] = "You successfully followed #{@followee.email}!"
		redirect_to :back
	end

	def destroy
		# followee means that we follow that user
		@followee = User.find(params[:followee_id])
		# unfollow functionality
		@unfollow = Follow.destroy(follower_id: params[:user_id], followee_id: params[:followee_id])

		flash[:notice] = "You successfully unfollowed #{@followee.email}!"
		redirect_to :back
	end
end
