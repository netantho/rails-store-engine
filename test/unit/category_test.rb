require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should_not allow_value('').for(:title)
  
  test 'Should init' do
    assert_equal Hash[:title => 'MyString'],
      FactoryGirl.attributes_for(:category)
  end
  
  test 'to_s should give title' do
    assert_equal FactoryGirl.create(:category).to_s, 'MyString'
  end
end
