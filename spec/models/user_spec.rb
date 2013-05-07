require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should_not allow_value('').for(:email) }
  it { should_not allow_value('truc').for(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should_not allow_value('').for(:password_digest) }
  
  it 'Should create' do
    FactoryGirl.create(:user)
  end
  
  describe 'Admin' do
    it 'Should create' do
      FactoryGirl.create(:admin)
    end
  end
end
