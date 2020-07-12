class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new
		@profile.user = current_user
		if @profile.save
			flash[:success] = "Your profile has been successfully made"
			redirect_to new_tweet_path
		else
			render 'new'
		end
	end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :age, :user_id)
	end



end
