require 'test_helper'
require 'devise'

class ShootingSessionsHelperTest < ActionView::TestCase

include Devise::TestHelpers

	test "check if session is owned" do
	
		u =  User.find(:all).first		
		
		s = ShootingSession.find(:all).first
		
		#puts "\n ------------------------------ \n #{s.id} - #{s.archer_id} - #{s.owner}"
		
		assert !is_sessionOwned(s,u)
		
	
	end

end
