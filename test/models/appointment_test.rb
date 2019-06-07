require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
 	def setup
    @appointment = appointments(:user1)
  end
  

  test "appointment should be valid" do
      assert @appointment.valid?
  end
  
  test "appointment date should be present" do
    @appointment.date = "   "
    assert @appointment.valid?
  end

  test "appointment should be present" do
    @appointment.completed = "   "
    assert @appointment.valid?
  end


end
