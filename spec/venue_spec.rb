require('spec_helper')
require('rspec')
require('venue')

describe (Venue) do
  it { should have_many(:bands) }
end
