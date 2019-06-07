require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
 def setup
    @patient = patients(:pat1)
  end

  test "should redirect to sign up" do
    get patients_path
    assert_redirected_to new_user_session_path
  end





  test "should update patient" do
    patch patient_url(@patient), params: { patient: { name: @patient.name, number: @patient.number, illness: @patient.illness } }
    assert_redirected_to new_user_session_path
  end
end
