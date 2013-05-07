Given /^a user$/ do
  FactoryGirl.create(:user)
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
