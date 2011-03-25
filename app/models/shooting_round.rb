class ShootingRound < ActiveRecord::Base
	belongs_to :s_session, :class_name => "ShootingSession", :foreign_key => "session_id"
	
	validates_presence_of :s_session, :on => :create, :message => "can't be blank.. something is wrong!"
	validates_presence_of :arrows,  :message => "can't be blank"
	validates_numericality_of :arrows, :only_integer => true
	validates_numericality_of :targets, :only_integer => true
	validates_numericality_of :spots, :only_integer => true
	
end
