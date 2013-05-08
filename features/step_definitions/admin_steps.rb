Given /^a category$/ do
  FactoryGirl.create(:category)
end

Given /^a product$/ do
  FactoryGirl.create(:product)
end

Given /^a table product$/ do
  FactoryGirl.create(:table)
end

Given /^an unvisible chair$/ do
  FactoryGirl.create(:product_unvisible)
end

Given /^a gift$/ do
  FactoryGirl.create(:product_with_category)
end

Given /^an admin$/ do
  FactoryGirl.create(:admin)
end

When /^I authentificate as an admin$/ do
  u = FactoryGirl.build(:admin)
  visit login_url
  fill_in "email", with: u.email
  fill_in "password", with: u.password
  within "form" do
    click_on "Log in"
  end
end
