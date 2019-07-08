require 'test_helper'

class PatientTest < ActiveSupport::TestCase

 	def setup
    @patient = patients(:pat1)
  end
  

  # test "patient should be valid" do
  #     assert @patient.valid?
  # end

  # test "number should be present" do
  #   @patient.number = "   "
  #   assert @patient.valid?
  # end

  # test "illness should be present" do
  #   @patient.illness = "   "
  #   assert @patient.valid?
  # end  

end
