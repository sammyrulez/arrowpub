class ShootingSession < ActiveRecord::Base
	belongs_to :shooting_range, :class_name => "ShootingRange", :foreign_key => "range_id"
	belongs_to :owner, :class_name => "User", :foreign_key => "archer_id"
	has_many :rounds, :class_name => "ShootingRound", :foreign_key => "session_id"
	
	validates_associated :owner, :on => :create
	validates_associated :shooting_range, :on => :create
	validates_presence_of :owner, :on => :create, :message => "something is wrong"
	validates_presence_of :shooting_range, :on => :create, :message => "something is wrong"
	validates_presence_of :performed_on, :on => :create, :message => "Date performed is mandatory"

  def stats

    ShootingSession.find(:all, :joins => :rounds, :select => "  sum(arrows) as arrows, sum(targets) as targets ,sum(spots) as spots").first


  end

	
	
end
