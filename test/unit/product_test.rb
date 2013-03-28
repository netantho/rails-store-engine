require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should_not allow_value('').for(:title)
  should validate_presence_of(:description)
  should_not allow_value('').for(:description)
  should validate_presence_of(:price)
  
  test 'Should init' do
    assert_equal Hash[:title => 'Chair',
      :description => 'Four chair legs',
      :price => 50.5,
      :photo => 'http://stars85.s.t.pic.centerblog.net/o/45124325.jpg'],
      FactoryGirl.attributes_for(:product)
  end
  
  test 'to_s should give title' do
    assert_equal FactoryGirl.create(:category).to_s, 'MyString'
  end
end
