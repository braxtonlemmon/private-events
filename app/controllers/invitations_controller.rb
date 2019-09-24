class InvitationsController < ApplicationController

	def create
		@invitation = current_user.invitations.build(invitation_params)
		if @invitation.save
			flash[:success] = 'Invitation sent!'
			redirect_to current_user
		else
			flash.now[:danger] = 'There was a problem with your invite. Try again.'
			redirect_to root_path	
		end
	end

	def update
		params.inspect
		@invitation = Invitation.find(params[:id])
		params[:choice] == '1' ? accept(@invitation) : reject(@invitation)
		redirect_to current_user
	end

	private

		def invitation_params
			params[:invitation][:pending] = true
			params.require(:invitation).permit(:attendee_id, :attended_event_id, :host_id, :pending, :accepted, :rejected)
		end
end
