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

When /^I fill in (.*) with (.*)$/ do |name, value|
  fill_in name, with: value
end

When /^I select (.*) from (.*)$/ do |value, field|
  select value, from: field
end

When /^I check (.*)/ do |locator|
  check locator
end
