require 'spec_helper'

describe Product do
  it { should validate_presence_of(:title) }
  it { should_not allow_value('').for(:title) }
  it { should validate_presence_of(:description) }
  it { should_not allow_value('').for(:description) }
  it { should validate_presence_of(:price) }
  
  it 'Should init' do
    assert_equal Hash[:title => 'Chair',
      :description => 'Four chair legs',
      :price => 50.5,
      :photo => 'http://stars85.s.t.pic.centerblog.net/o/45124325.jpg',],
      FactoryGirl.attributes_for(:product)
  end
  
  it 'to_s should give title' do
    assert_equal FactoryGirl.create(:product).to_s, 'Chair'
  end
end