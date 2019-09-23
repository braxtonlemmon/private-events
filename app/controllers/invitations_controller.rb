class InvitationsController < ApplicationController

	def new
		@invitation = Invitation.new
		@events = Event.where(creator_id: current_user.id)
		@users = User.where.not(id: current_user.id)

	end

	def create
		@event = Event.find(params[:invitation][:attended_event_id])
		@invitation = @event.invitations.build(invitation_params)
		if @invitation.save
			flash[:success] = 'Invitation sent!'
			redirect_to current_user
		else
			flash.now[:danger] = 'There was a problem with your invite. Try again.'
			render 'new'
		end
	end

	private

		def invitation_params
			params.require(:invitation).permit(:attendee_id, :attended_event_id, :pending,
																				 :accepted, :rejected)
			{ attendee_id:       params[:invitation][:attendee_id],
				attended_event_id: params[:invitation][:attended_event_id],
				host_id:           params[:invitation][:host_id] }
		end
end
