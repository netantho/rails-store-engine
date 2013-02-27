require 'test_helper'

class Admin::ProductTest < ActionDispatch::IntegrationTest
  test "visit products" do
    visit admin_products_path
    click_on 'New Product'
    assert_equal current_path, new_admin_product_path
  end
end