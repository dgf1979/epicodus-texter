require 'rails_helper'

describe Message, :vcr => true do
  it { should validate_presence_of(:to) }
  it { should validate_presence_of(:from) }
  it { should validate_presence_of(:body) }
end
