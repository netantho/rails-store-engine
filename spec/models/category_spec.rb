require 'spec_helper'

describe Category do
  it { should validate_presence_of(:title) }
  it { should_not allow_value('').for(:title) }
  it { should have_many(:classifications) }
  it { should have_many(:products) }
  
  it 'Should init' do
    assert_equal Hash[title: 'MyString'],
      FactoryGirl.attributes_for(:category)
  end
  
  it 'to_s should give title' do
    assert_equal FactoryGirl.create(:category).to_s, 'MyString'
  end
end