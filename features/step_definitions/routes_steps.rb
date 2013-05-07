When /^I go to the admin page$/ do
  visit root_url
end

Then /^I'm on the Home page$/ do
  assert_equal current_path, root_path, 'Should be on the Home page'
end

Then /^I'm on the Products page$/ do
  assert_equal current_path, admin_products_path, 'Should be on the Products page'
end

Then /^I'm on the New Product page$/ do
  assert_equal current_path, new_admin_product_path, 'Should be on the New Product page'
end

Then /^I'm on the Categories page$/ do
  assert_equal current_path, admin_categories_path, 'Should be on the Categories page'
end

Then /^I'm on the New Category page$/ do
  assert_equal current_path, new_admin_category_path, 'Should be on the New Category page'
end
