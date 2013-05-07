Given /^a category$/ do
  FactoryGirl.create(:category)
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
