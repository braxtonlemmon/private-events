require 'test_helper'

class EventTest < ActiveSupport::TestCase
	def setup
		@user = users(:braxton)
		@event = @user.events.build(description: 'Bowling', date: 3.days.ago)
	end
	
	test 'should be valid' do 
		assert @event.valid?
	end

	test 'description should be present' do 
		@event.description = '' 
		assert_not @event.valid? 
	end

	test 'date should be present' do 
		@event.date = ''
		assert_not @event.valid?
	end

	test 'description should be at most 1000 characters' do 
		@event.description = 'a' * 1001
		assert_not @event.valid? 
	end
end
