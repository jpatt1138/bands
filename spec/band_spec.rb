require('spec_helper')
require('rspec')
require('band')

describe (Band) do
  it { should have_and_belong_to_many(:venues) }
end
