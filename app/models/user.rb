class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:is_admin

    def stats

    ShootingSession.find(:all ,:conditions => {:archer_id => self.id} , :joins => :rounds, :select => "  sum(arrows) as arrows, sum(targets) as targets ,sum(spots) as spots").first


    end

  def trends
    ShootingSession.find(:all ,:conditions => {:archer_id => self.id} , :joins => :rounds, :select => "  sum(arrows) as arrows, sum(targets) as targets ,sum(spots) as spots , performed_on " , :group => " performed_on ")


  end

end
