require 'spec_helper'

describe Sale do
  it { should validate_presence_of(:quantity) }
  it { should_not allow_value(nil).for(:quantity) }
  it { should_not allow_value(-1).for(:quantity) }
  it { should validate_presence_of(:price) }
  it { should_not allow_value(nil).for(:price) }
  it { should_not allow_value(-1).for(:price) }
  it { should validate_presence_of(:product) }
  
  it 'Should create' do
    FactoryGirl.create(:sale)
  end
end
