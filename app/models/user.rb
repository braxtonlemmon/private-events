class User < ApplicationRecord
	# Also a 'creator'
	# Also an 'attendee'
	has_many :events, foreign_key: :creator_id
	has_many :invitations, foreign_key: :attendee_id
	has_many :attended_events, through: :invitations, source: :attended_event

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
	def upcoming_events
	  attended_events.where('date >= :current_time', current_time: DateTime.now)
	end

	def previous_events
		attended_events.where('date < :current_time', current_time: DateTime.now)
	end
end
