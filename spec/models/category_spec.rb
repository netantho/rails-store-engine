require 'spec_helper'

describe Category do
  it { should validate_presence_of(:title) }
  it { should_not allow_value('').for(:title) }
end