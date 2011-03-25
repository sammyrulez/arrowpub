require 'test_helper'

class ShootingRangeTest < ActiveSupport::TestCase
  
  test "should not save range without name" do
    
    range = ShootingRange.new
    range.description = "dummy"
    assert !range.save

  end
  
   test "should not save range without descr" do

    range = ShootingRange.new
    range.name = "dummy"
    assert !range.save

  end
  
  
  
end
