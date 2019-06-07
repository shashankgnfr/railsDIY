require 'test_helper'

class LocationTest < ActiveSupport::TestCase
 	def setup
    @location = locations(:loc1)
  end
  

  test "location should be valid" do
      assert @location.valid?
  end


  test "latitude should be present" do
      @location.latitude = "   "
      assert @location.valid?
  end

  test "longitude should be present" do
    @location.longitude = "   "
    assert @location.valid?
  end
end
