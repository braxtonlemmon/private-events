class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user
			log_in @user
			redirect_to @user
		else
			redirect_to root_url
		end
	end
end
