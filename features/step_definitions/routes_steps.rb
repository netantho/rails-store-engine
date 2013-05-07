Then /^I'm on the Home page$/ do
  assert_equal current_path, root_path, 'Should be on the Home page'
end

Then /^I'm on the Products page$/ do
  assert_equal current_path, admin_products_path, 'Should be on the Products page'
end

Then /^I'm on the Categories page$/ do
  assert_equal current_path, admin_categories_path, 'Should be on the Categories page'
end
