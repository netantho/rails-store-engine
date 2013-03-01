require 'test_helper'

class Admin::ProductTest < ActionDispatch::IntegrationTest
  test "visit products" do
    visit admin_products_path
    click_on 'New Product'
    assert_equal current_path, new_admin_product_path
  end
  
  test 'visit product list' do
    visit admin_products_path
    assert has_content?('Title'), 'Title unavailable'
    assert has_content?('Price'), 'Price unavailable' 
  end
  
  test "product lifecycle" do
    # New product
    visit new_admin_product_path
    assert has_content?('Title'),  'No title can be given in new'
    assert has_content?('Description'), 'No description can be given in new'
    fill_in 'product_title', with: 'test'
    fill_in 'product_description', with: 'test area'
    assert has_content?('Price'), 'No price can be given in new'
    fill_in 'product_price', with: '5'
    assert has_content?('Price'), 'No photo can be given in new'
    fill_in 'product_photo', with: 'http://stars85.s.t.pic.centerblog.net/o/45124325.jpg'
    click_button 'Create Product'
    assert has_content?('Product was successfully created.'), 'Product was not successfully created'
    visit admin_products_path
    assert has_content?('test'), 'Product doesn\'t appear on the products list page'
    
    # Edit product
    all('a').select {|elt| elt.text == "Edit" }.last.click
    fill_in 'product_title', with: 'test2'
    fill_in 'product_description', with: 'test area2'
    fill_in 'product_price', with: '2'
    click_button 'Update Product'
    assert has_content?('Product was successfully updated.'), 'Product was not successfully updated'
    click_on 'Back'
    assert_equal current_path, admin_products_path
    
    # Show product
    all('a').select {|elt| elt.text == "Show" }.last.click
    assert has_content?('Title'),  'No title is not shown'
    assert has_content?('Description'),  'No description is not shown'
    assert has_content?('Price'),  'No price is not shown'
    assert has_xpath?("//img[@src = 'http://stars85.s.t.pic.centerblog.net/o/45124325.jpg']"), 'No image shown'
    
    # TODO: Delete product
  end
end