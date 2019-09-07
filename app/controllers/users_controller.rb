class UsersController < ApplicationController
	def new
		@user = User.new
  end

  def create
  end

	def show
		@user = User.find(params[:id])
		@events = @user.events
		@upcoming_events = @user.upcoming_events
		@prev_events = @user.previous_events
  end
end
