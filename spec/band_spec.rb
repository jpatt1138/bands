require('spec_helper')
require('rspec')
require('band')

describe (Band) do
  it { should have_many(:venues) }
end
