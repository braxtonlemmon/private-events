class EventsController < ApplicationController
	def new
		@event = Event.new
  end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			@event.description.capitalize!
			redirect_to current_user
		end
  end

	def show
		@invitation = current_user.invitations.build
		@users = User.where.not(id: current_user.id)
		@event = Event.find(params[:id])
		@invited = @event.attendees.where('pending')
		@accepted = @event.attendees.where('accepted')
		@rejected = @event.attendees.where('rejected')
  end

	def index
		@upcoming = Event.upcoming
		@past = Event.past
	end
	
	private

		def event_params
			params.require(:event).permit(:description, :date)
		end
end
