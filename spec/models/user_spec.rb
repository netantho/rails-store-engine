require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should_not allow_value('').for(:email) }
  it { should_not allow_value('truc').for(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should_not allow_value('').for(:password_digest) }
  it { should validate_presence_of(:full_name) }
  it { should_not allow_value('').for(:full_name) }
  it { should_not allow_value('').for(:display_name) }
  it { should_not allow_value('t').for(:display_name) }
  it { should allow_value('toto').for(:display_name) }
  it { should_not allow_value('a'*33).for(:display_name) }
  
  it 'Should create' do
    FactoryGirl.create(:user)
  end
  
  describe 'Admin' do
    it 'Should create' do
      FactoryGirl.create(:admin)
    end
  end
end
