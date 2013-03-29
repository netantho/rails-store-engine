require 'test_helper'

class Admin::ProductTest < ActionDispatch::IntegrationTest
  test 'visit product list' do
    visit admin_products_path
    within 'h1' do
      assert has_content?('Listing products'), 'Listing Products title not present'
    end
    within 'table' do
      assert has_content?('Title'), 'Title unavailable'
      assert has_content?('Categories'), 'Categories unavailable'
      assert has_content?('Price'), 'Price unavailable'
    end
  end
  
  def new_product(categories = nil)
    assert has_content?('Title'),  'No title can be given in new'
    assert has_content?('Description'), 'No description can be given in new'
    fill_in 'product_title', with: 'test'
    fill_in 'product_description', with: 'test area'
    assert has_content?('Price'), 'No price can be given in new'
    fill_in 'product_price', with: '5'
    assert has_content?('Price'), 'No photo can be given in new'
    fill_in 'product_photo', with: 'http://stars85.s.t.pic.centerblog.net/o/45124325.jpg'
    if categories
      categories.each { |c| find(:xpath, "//input[@value='#{c.id}']").set(true) }
    end
    click_button 'Create Product'
  end 
  
  # TODO: test categories
  def edit_product
    fill_in 'product_title', with: 'test2'
    fill_in 'product_description', with: 'test area2'
    fill_in 'product_price', with: '2'
    click_button 'Update Product'
  end
  
  def show_product(categories = nil)
    assert has_content?('Title'),  'title is not shown'
    assert has_content?('Description'),  'description is not shown'
    assert has_content?('Price'),  'price is not shown'
    assert has_xpath?("//img[@src = 'http://stars85.s.t.pic.centerblog.net/o/45124325.jpg']"), 'No image shown'
    if categories
      categories.each { |c| assert has_content?(c.title), '#{c.title} category is not shown'}
    end
  end
  
  test "product lifecycle" do
    # New product
    visit new_admin_product_path
    new_product
    assert has_content?('Product was successfully created.'), 'Product was not successfully created'
    visit admin_products_path
    assert has_content?('test'), 'Product doesn\'t appear on the products list page'
    
    # Edit product
    all('a').select {|elt| elt.text == "Edit" }.last.click
    edit_product
    assert has_content?('Product was successfully updated.'), 'Product was not successfully updated'
    click_on 'Back'
    assert_equal current_path, admin_products_path
    
    # Show product
    all('a').select {|elt| elt.text == "Show" }.last.click
    show_product
  
    # TODO: Delete product
  end
  
  test 'Product with category' do
    # New category
    c = FactoryGirl.create(:category)
    
    # New product
    visit new_admin_product_path
    new_product [c]
    assert has_content?('Product was successfully created.'), 'Product was not successfully created'
    visit admin_products_path
    assert has_content?('test'), 'Product doesn\'t appear on the products list page'
    
    # Edit product
    all('a').select {|elt| elt.text == "Edit" }.last.click
    # TODO: test categories
    edit_product
    assert has_content?('Product was successfully updated.'), 'Product was not successfully updated'
    click_on 'Back'
    assert_equal current_path, admin_products_path
    
    # Show product
    all('a').select {|elt| elt.text == "Show" }.last.click
    show_product [c]
      
    # TODO: Delete product
  end
end