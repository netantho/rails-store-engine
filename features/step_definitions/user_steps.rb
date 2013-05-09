Given /^a user$/ do
  FactoryGirl.create(:user)
end

Given /^an order$/ do
  FactoryGirl.create(:order)
end

When /^I authentificate as a user$/ do
  u = FactoryGirl.build(:user)
  visit login_url
  fill_in "email", with: u.email
  fill_in "password", with: u.password
  within "form" do
    click_on "Log in"
  end
end
