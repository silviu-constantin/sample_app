require "application_system_test_case"

class BindusTest < ApplicationSystemTestCase
  setup do
    @bindu = bindus(:one)
  end

  test "visiting the index" do
    visit bindus_url
    assert_selector "h1", text: "Bindus"
  end

  test "creating a Bindu" do
    visit bindus_url
    click_on "New Bindu"

    fill_in "Menu", with: @bindu.menu
    fill_in "Name", with: @bindu.name
    click_on "Create Bindu"

    assert_text "Bindu was successfully created"
    click_on "Back"
  end

  test "updating a Bindu" do
    visit bindus_url
    click_on "Edit", match: :first

    fill_in "Menu", with: @bindu.menu
    fill_in "Name", with: @bindu.name
    click_on "Update Bindu"

    assert_text "Bindu was successfully updated"
    click_on "Back"
  end

  test "destroying a Bindu" do
    visit bindus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bindu was successfully destroyed"
  end
end
