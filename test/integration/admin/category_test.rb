require 'test_helper'

class Admin::CategoryTest < ActionDispatch::IntegrationTest
  test 'visit category list' do
    visit admin_categories_path
    within 'h1' do
      assert has_content?('Listing categories'), 'Listing categories title not present'
    end
    assert has_content?('Title'), 'Title unavailable'
  end
  
  test "category lifecycle" do
    # New category
    visit new_admin_category_path
    assert has_content?('Title'),  'No title can be given in new'
    fill_in 'category_title', with: 'test'
    click_button 'Create Category'
    assert has_content?('Category was successfully created.'), 'Category was not successfully created'
    visit admin_categories_path
    assert has_content?('test'), 'Category doesn\'t appear on the category list page'
    
    # Edit category
    all('a').select {|elt| elt.text == "Edit" }.last.click
    fill_in 'category_title', with: 'test2'
    click_button 'Update Category'
    assert has_content?('Category was successfully updated.'), 'Category was not successfully updated'
    click_on 'Back'
    assert_equal current_path, admin_categories_path
    
    # Show product
    all('a').select {|elt| elt.text == "Show" }.last.click
    assert has_content?('test2'),  'title is not shown'
    
    # TODO: Delete product
  end
end