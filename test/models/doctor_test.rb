require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
 	def setup
    @doctor = doctors(:doc1)
  end
  

  test "doctor should be valid" do
      assert @doctor.valid?
  end

  test "name should be present" do
      @doctor.name = "   "
      assert @doctor.valid?
  end

  test "designation should be present" do
    @doctor.designation = "   "
    assert @doctor.valid?
  end


end
