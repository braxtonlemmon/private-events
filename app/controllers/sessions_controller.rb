class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user
			log_in @user
			redirect_to @user
		else
			flash.now[:danger] = 'Invalid login information'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		flash[:success] = "Successfully logged out!"
		redirect_to root_url
	end
end
