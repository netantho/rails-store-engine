Then /^I see (.*)$/ do |text|
  page.should have_content(text)
end

When /^I click on (.*)$/ do |text|
  click_on text
end
