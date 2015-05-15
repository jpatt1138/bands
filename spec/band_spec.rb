require('spec_helper')
require('rspec')
require('band')

# describe (Band) do
#   it { should have_many(:venues) }
# end

describe(Band) do
  it("has many venues") do
    band = Band.create({:name => "band"})
    venue1 = Venue.create({:name => "venue1"})
    venue2 = Venue.create({:name => "venue2"})
    expect(band.venues()).to(eq([venue1, venue2]))
  end
end
