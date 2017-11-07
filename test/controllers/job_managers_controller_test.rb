require 'test_helper'

class JobManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_manager = job_managers(:one)
  end

  test "should get index" do
    get job_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_job_manager_url
    assert_response :success
  end

  test "should create job_manager" do
    assert_difference('JobManager.count') do
      post job_managers_url, params: { job_manager: { name: @job_manager.name } }
    end

    assert_redirected_to job_manager_url(JobManager.last)
  end

  test "should show job_manager" do
    get job_manager_url(@job_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_manager_url(@job_manager)
    assert_response :success
  end

  test "should update job_manager" do
    patch job_manager_url(@job_manager), params: { job_manager: { name: @job_manager.name } }
    assert_redirected_to job_manager_url(@job_manager)
  end

  test "should destroy job_manager" do
    assert_difference('JobManager.count', -1) do
      delete job_manager_url(@job_manager)
    end

    assert_redirected_to job_managers_url
  end
end
