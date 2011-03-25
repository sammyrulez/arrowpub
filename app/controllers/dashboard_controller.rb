class DashboardController < ApplicationController
  def index

    @shooting_ranges = ShootingRange.find(:all)

    if  user_signed_in?

      @shooting_sessions = ShootingSession.find_all_by_archer_id current_user.id


    end

  end

end
