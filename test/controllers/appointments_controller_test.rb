require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @appointment = appointments(:user1)
  end

  test "shour redirect to sign up" do
    get appointments_path
    assert_redirected_to new_user_session_path
  end

  # test "should create appointment" do
  #   assert_difference('Appointment.count') do
  #   post locations_url, params: { appointment: { date: @appointment.date, completed: @appointment.completed, doctor_id: @appointment.doctor_id, patient_id: @appointment.patient_id } }
  #   end
  #   assert_redirected_to location_url(Appointment.last)
  # end

  # test "should show appointment" do
  #   get location_url(@appointment)
  #   assert_response :success
  # end







end
