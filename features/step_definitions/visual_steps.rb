Then /^I see (.*)$/ do |text|
  page.should have_content(text)
end

Then /^I don't see (.*)$/ do |text|
  page.should_not have_content(text)
end

When /^I click on the last (.*)$/ do |text|
  all('a').select {|elt| elt.text == text }.last.click
end

When /^I click on (.*)$/ do |text|
  click_on text
end

When /^I click on (.*) within (.*)$/ do |text, scope|
  within(scope) do
    click_on text
  end
end

When /^I fill in (.*) with (.*)$/ do |name, value|
  fill_in name, with: value
end

When /^I select (.*) from (.*)$/ do |value, field|
  select value, from: field
end

When /^I check (.*)/ do |locator|
  check locator
end

When /^I uncheck (.*)/ do |locator|
  uncheck locator
end

Then /^I should see the icon (.*)$/ do |image|
  page.should have_selector("i.#{image}")
end

Then /^I should not see the icon (.*)$/ do |image|
  page.should_not have_selector("i.#{image}")
end

When /^I click on icon (.*)$/ do |image|
  find(:xpath, "//a/i[@class='#{image}']/..").click
end
