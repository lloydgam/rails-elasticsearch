require "test_helper"

class MbsItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mbs_item = mbs_items(:one)
  end

  test "should get index" do
    get mbs_items_url
    assert_response :success
  end

  test "should get new" do
    get new_mbs_item_url
    assert_response :success
  end

  test "should create mbs_item" do
    assert_difference('MbsItem.count') do
      post mbs_items_url, params: { mbs_item: { description: @mbs_item.description, end_date: @mbs_item.end_date, is_latest: @mbs_item.is_latest, reference: @mbs_item.reference, start_date: @mbs_item.start_date } }
    end

    assert_redirected_to mbs_item_url(MbsItem.last)
  end

  test "should show mbs_item" do
    get mbs_item_url(@mbs_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_mbs_item_url(@mbs_item)
    assert_response :success
  end

  test "should update mbs_item" do
    patch mbs_item_url(@mbs_item), params: { mbs_item: { description: @mbs_item.description, end_date: @mbs_item.end_date, is_latest: @mbs_item.is_latest, reference: @mbs_item.reference, start_date: @mbs_item.start_date } }
    assert_redirected_to mbs_item_url(@mbs_item)
  end

  test "should destroy mbs_item" do
    assert_difference('MbsItem.count', -1) do
      delete mbs_item_url(@mbs_item)
    end

    assert_redirected_to mbs_items_url
  end
end
