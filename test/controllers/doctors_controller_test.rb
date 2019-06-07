require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @doctor = doctors(:doc1)
  end

  test "should redirect to sign up" do
    get doctors_path
    assert_redirected_to new_user_session_path
  end




  test "should update patient" do
    patch doctor_url(@doctor), params: { dactor: { name: @doctor.name, designation: @doctor.designation, timing: @doctor.timing} }
    assert_redirected_to new_user_session_path
  end
end
