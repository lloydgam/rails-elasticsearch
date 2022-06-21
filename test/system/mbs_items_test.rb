require "application_system_test_case"

class MbsItemsTest < ApplicationSystemTestCase
  setup do
    @mbs_item = mbs_items(:one)
  end

  test "visiting the index" do
    visit mbs_items_url
    assert_selector "h1", text: "Mbs Items"
  end

  test "creating a Mbs item" do
    visit mbs_items_url
    click_on "New Mbs Item"

    fill_in "Description", with: @mbs_item.description
    fill_in "End date", with: @mbs_item.end_date
    check "Is latest" if @mbs_item.is_latest
    fill_in "Reference", with: @mbs_item.reference
    fill_in "Start date", with: @mbs_item.start_date
    click_on "Create Mbs item"

    assert_text "Mbs item was successfully created"
    click_on "Back"
  end

  test "updating a Mbs item" do
    visit mbs_items_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mbs_item.description
    fill_in "End date", with: @mbs_item.end_date
    check "Is latest" if @mbs_item.is_latest
    fill_in "Reference", with: @mbs_item.reference
    fill_in "Start date", with: @mbs_item.start_date
    click_on "Update Mbs item"

    assert_text "Mbs item was successfully updated"
    click_on "Back"
  end

  test "destroying a Mbs item" do
    visit mbs_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mbs item was successfully destroyed"
  end
end
