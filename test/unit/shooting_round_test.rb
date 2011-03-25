require 'test_helper'

class ShootingRoundTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not save round without session" do
    s = ShootingRound.new
    s.arrows = 1
    assert !s.save
    
  end
  
  test "should not save round without arrows" do
    s = ShootingRound.new
    s.s_session = ShootingSession.find(:all).first
    assert !s.save
  end
  
  
  test "should not save round with invalid data" do
    s = ShootingRound.new
    s.s_session = ShootingSession.find(:all).first
    
    s.arrows = 'A'
    s.targets = 'A'
    s.spots = 'A'   
    
    assert !s.save   
    
  end
  
  test "should not save round with invalid data arrows" do
    s = ShootingRound.new
    s.s_session = ShootingSession.find(:all).first

    s.arrows = 'A'
    s.targets = 0
    s.spots = 0   

    assert !s.save   

  end
  
  test "should not save round with invalid data targets" do
    s = ShootingRound.new
    s.s_session = ShootingSession.find(:all).first

    s.arrows = 0
    s.targets = 'A'
    s.spots = 0   

    assert !s.save   

  end
  
   test "should not save round with invalid data spots" do
    s = ShootingRound.new
    s.s_session = ShootingSession.find(:all).first

    s.arrows = 0
    s.targets = 0
    s.spots = 'A'  

    assert !s.save   

  end
  
  
   test "should  save round with  all data ok" do
    s = ShootingRound.new
    s.s_session = ShootingSession.find(:all).first
    s.arrows = 1
    s.targets = 0
    s.spots = 0  
    
    out = s.save
    
    puts "should  save round with  all data ok errors: #{s.errors}"
    
    assert out    
    s.destroy

  end
  
end
