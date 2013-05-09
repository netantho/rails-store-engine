require 'spec_helper'

describe Order do
  it { should validate_presence_of(:status) }
  it { should allow_value('pending').for(:status) }
  it { should allow_value('cancelled').for(:status) }
  it { should allow_value('paid').for(:status) }
  it { should allow_value('shipped').for(:status) }
  it { should allow_value('returned').for(:status) }
  it { should_not allow_value('a').for(:status) }
  it { should validate_presence_of(:total_price) }
  it { should allow_value(1.5).for(:total_price) }
  it { should_not allow_value(-1).for(:total_price) }
  it { should validate_presence_of(:sales) }
  it { should validate_presence_of(:user) }
  
  it 'Should create' do
    FactoryGirl.create(:order)
  end
end
