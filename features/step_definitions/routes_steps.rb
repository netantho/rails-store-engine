When /^I go to the root page$/ do
  visit root_url
end

When /^I go to the Admin page$/ do
  visit admin_products_path
end

When /^I go to the Admin Categories page$/ do
  visit admin_categories_path
end

Then /^I'm on the Home page$/ do
  assert_equal current_path, root_path, 'Should be on the Home page'
end

Then /^I'm on the Admin Products page$/ do
  assert_equal current_path, admin_products_path, 'Should be on the Admin Products page'
end

Then /^I'm on the Admin New Product page$/ do
  assert_equal current_path, new_admin_product_path, 'Should be on the Admin New Product page'
end

Then /^I'm on the Admin Categories page$/ do
  assert_equal current_path, admin_categories_path, 'Should be on the Admin Categories page'
end

Then /^I'm on the Admin New Category page$/ do
  assert_equal current_path, new_admin_category_path, 'Should be on the Admin New Category page'
end

Then /^I'm on the Cart page$/ do
  assert_equal current_path, cart_path, 'Should be on the Cart page'
end

Then /^I'm on the Register page$/ do
  assert_equal current_path, register_path, 'Should be on the Register page'
end

Then /^I'm on the Log in page$/ do
  assert_equal current_path, login_path, 'Should be on the Log in page'
end
