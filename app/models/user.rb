class User < ApplicationRecord
	# Also a 'creator'
	# Also an 'attendee'
	has_many :events, foreign_key: :creator_id
	has_many :invitations, foreign_key: :attendee_id
	has_many :attended_events, through: :invitations, source: :attended_event

	def upcoming_events
	  attended_events.where('date >= :current_time', current_time: DateTime.now)
	end

	def previous_events
		attended_events.where('date < :current_time', current_time: DateTime.now)
	end
end
