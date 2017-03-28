require 'test_helper'

class PurchaseItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get purchase_items_show_url
    assert_response :success
  end

end
