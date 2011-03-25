require 'test_helper'

class ShootingSessionTest < ActiveSupport::TestCase
  
  test "should not save range without date" do
  
    session = ShootingSession.new
    
    assert !session.save
   
  end
  
  test "should not save range without user and range" do

    session = ShootingSession.new
    session.performed_on = Date.new

    assert !session.save

  end
  
   test "should not save range with invalid user and range" do

    session = ShootingSession.new
    session.performed_on = Date.new
    session.shooting_range = ShootingRange.new
    session.owner = User.new

    assert !session.save

  end
  
  test "should save if is all ok" do

    session = ShootingSession.new
    session.performed_on = Date.new
    session.shooting_range = ShootingRange.find(:all).first
    session.owner = User.find(:all).first

    assert session.save
    
    session.destroy

  end
  
end
