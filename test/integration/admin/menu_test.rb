require 'test_helper'

class Admin::MenuTest < ActionDispatch::IntegrationTest
  test 'visit throughout the menu' do
    visit root_url
    click_on 'Home'
    assert_equal current_path, root_path, 'Should be on the Home page'
    click_on 'Products'
    assert_equal current_path, admin_products_path, 'Should be on the Admin Products page'
    click_on 'Categories'
    assert_equal current_path, categories_path, 'Should be on the Categories page'
  end
end