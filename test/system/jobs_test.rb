require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Address", with: @job.address
    fill_in "Client", with: @job.client_id
    fill_in "Job type", with: @job.job_type
    fill_in "Location", with: @job.location_id
    fill_in "Price", with: @job.price
    fill_in "Quantity", with: @job.quantity
    fill_in "Source", with: @job.source_id
    fill_in "Start date", with: @job.start_date
    fill_in "Status", with: @job.status
    fill_in "Vehicle", with: @job.vehicle_id
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Address", with: @job.address
    fill_in "Client", with: @job.client_id
    fill_in "Job type", with: @job.job_type
    fill_in "Location", with: @job.location_id
    fill_in "Price", with: @job.price
    fill_in "Quantity", with: @job.quantity
    fill_in "Source", with: @job.source_id
    fill_in "Start date", with: @job.start_date
    fill_in "Status", with: @job.status
    fill_in "Vehicle", with: @job.vehicle_id
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "Job was successfully destroyed"
  end
end
