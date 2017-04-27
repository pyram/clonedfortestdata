require 'test_helper'

class JobLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_location = job_locations(:one)
  end

  test "should get index" do
    get job_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_job_location_url
    assert_response :success
  end

  test "should create job_location" do
    assert_difference('JobLocation.count') do
      post job_locations_url, params: { job_location: { info: @job_location.info, name: @job_location.name, url: @job_location.url } }
    end

    assert_redirected_to job_location_url(JobLocation.last)
  end

  test "should show job_location" do
    get job_location_url(@job_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_location_url(@job_location)
    assert_response :success
  end

  test "should update job_location" do
    patch job_location_url(@job_location), params: { job_location: { info: @job_location.info, name: @job_location.name, url: @job_location.url } }
    assert_redirected_to job_location_url(@job_location)
  end

  test "should destroy job_location" do
    assert_difference('JobLocation.count', -1) do
      delete job_location_url(@job_location)
    end

    assert_redirected_to job_locations_url
  end
end
