require "application_system_test_case"

class QrcodesTest < ApplicationSystemTestCase
  setup do
    @qrcode = qrcodes(:one)
  end

  test "visiting the index" do
    visit qrcodes_url
    assert_selector "h1", text: "Qrcodes"
  end

  test "creating a Qrcode" do
    visit qrcodes_url
    click_on "New Qrcode"

    fill_in "Name", with: @qrcode.name
    click_on "Create Qrcode"

    assert_text "Qrcode was successfully created"
    click_on "Back"
  end

  test "updating a Qrcode" do
    visit qrcodes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @qrcode.name
    click_on "Update Qrcode"

    assert_text "Qrcode was successfully updated"
    click_on "Back"
  end

  test "destroying a Qrcode" do
    visit qrcodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Qrcode was successfully destroyed"
  end
end
