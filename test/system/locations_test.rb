require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "should create location" do
    visit locations_url
    click_on "New location"

    fill_in "City", with: @location.city
    fill_in "Client", with: @location.client_id
    fill_in "Name", with: @location.name
    fill_in "State", with: @location.state
    fill_in "Street", with: @location.street
    fill_in "Zip", with: @location.zip
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "should update Location" do
    visit location_url(@location)
    click_on "Edit this location", match: :first

    fill_in "City", with: @location.city
    fill_in "Client", with: @location.client_id
    fill_in "Name", with: @location.name
    fill_in "State", with: @location.state
    fill_in "Street", with: @location.street
    fill_in "Zip", with: @location.zip
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "should destroy Location" do
    visit location_url(@location)
    click_on "Destroy this location", match: :first

    assert_text "Location was successfully destroyed"
  end
end
