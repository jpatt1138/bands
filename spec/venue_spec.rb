require('spec_helper')
require('rspec')
require('venue')

describe (Venue) do
  it { should have_and_belong_to_many(:bands) }
end
