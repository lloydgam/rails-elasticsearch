require "application_system_test_case"

class MbsOnlinesTest < ApplicationSystemTestCase
  setup do
    @mbs_online = mbs_onlines(:one)
  end

  test "visiting the index" do
    visit mbs_onlines_url
    assert_selector "h1", text: "Mbs Onlines"
  end

  test "creating a Mbs online" do
    visit mbs_onlines_url
    click_on "New Mbs Online"

    fill_in "Description", with: @mbs_online.description
    fill_in "Description end", with: @mbs_online.description_end
    fill_in "Description start", with: @mbs_online.description_start
    fill_in "Item", with: @mbs_online.item_id
    check "Latest" if @mbs_online.latest
    click_on "Create Mbs online"

    assert_text "Mbs online was successfully created"
    click_on "Back"
  end

  test "updating a Mbs online" do
    visit mbs_onlines_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mbs_online.description
    fill_in "Description end", with: @mbs_online.description_end
    fill_in "Description start", with: @mbs_online.description_start
    fill_in "Item", with: @mbs_online.item_id
    check "Latest" if @mbs_online.latest
    click_on "Update Mbs online"

    assert_text "Mbs online was successfully updated"
    click_on "Back"
  end

  test "destroying a Mbs online" do
    visit mbs_onlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mbs online was successfully destroyed"
  end
end
