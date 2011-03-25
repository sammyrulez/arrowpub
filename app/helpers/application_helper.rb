module ApplicationHelper

	def is_admin_user
		if  user_signed_in?
			return   current_user.is_admin
		else
			return false
		end
		
	end

end
