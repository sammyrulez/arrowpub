module ShootingSessionsHelper

	def is_sessionOwned(session , pass_user = current_user)
	
		return session.owner == pass_user
		
	end

end
