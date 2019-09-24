module InvitationsHelper
	def accept(invitation)
		invitation.update_columns(pending: 0, accepted: 1)
	end

	def reject(invitation)
		invitation.update_columns(pending: 0, rejected: 1)
	end
end
