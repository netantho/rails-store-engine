require 'spec_helper'

describe Product do
  it { should validate_presence_of(:title) }
  it { should_not allow_value('').for(:title) }
  it { should validate_presence_of(:description) }
  it { should_not allow_value('').for(:description) }
  it { should validate_presence_of(:price) }
  it { should_not allow_value('a').for(:price) }
  it { should_not allow_value(-4).for(:price) }
  it { should_not allow_value('8.8.8.8').for(:photo) }
  it { should allow_value('').for(:photo) }
  it { should allow_value(false).for(:visible) }
  it { should have_many(:categories) }
  it { should have_many(:classifications) }
  
  it 'Should init' do
    assert_equal Hash[title: 'Chair',
      description: 'Four chair legs',
      price: 50.5,
      visible: true],
      FactoryGirl.attributes_for(:product)
  end
  
  it 'to_s should give title' do
    assert_equal FactoryGirl.create(:product).to_s, 'Chair'
  end
  
  it 'Can be visible or unvisible' do
    p = FactoryGirl.create(:product_unvisible)
    p.visible.should be_false
    p.visible = true
    p.save
    p.visible.should be_true
  end
end