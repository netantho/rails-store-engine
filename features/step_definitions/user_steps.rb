Given /^a user$/ do
  FactoryGirl.create(:user)
end

Given /^an order$/ do
  FactoryGirl.create(:order)
end

Given /^a cancelled order$/ do
  FactoryGirl.create(:order_cancelled)
end

Given /^a paid order$/ do
  FactoryGirl.create(:order_paid)
end

Given /^a shipped order$/ do
  FactoryGirl.create(:order_shipped)
end

Given /^a returned order$/ do
  FactoryGirl.create(:order_returned)
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
