require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @location = locations(:loc1)
  end

  test "should redirect to sign up" do
    get locations_path
    assert_redirected_to new_user_session_path
  end


  test "should get new" do
    get new_location_url
    assert_redirected_to new_user_session_path
  end

  test "should show location" do
    get location_url(@location)
    assert_redirected_to new_user_session_path
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_redirected_to new_user_session_path
  end

  test "should update location" do
    patch location_url(@location), params: { location: { address: @location.address, latitude: @location.latitude, longitude: @location.longitude } }
    assert_redirected_to new_user_session_path
  end

  test "should destroy location" do
    
    delete location_url(@location)
  

    assert_redirected_to new_user_session_path
  end
end
