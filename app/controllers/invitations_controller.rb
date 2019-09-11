class InvitationsController < ApplicationController

	def new
		@invite = Invitation.new
	end

	def create
	end
end
