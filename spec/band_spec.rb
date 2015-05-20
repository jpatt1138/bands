require('spec_helper')

describe (Band) do
  it { should have_and_belong_to_many(:venues) }
  it { should validate_presence_of(:name) }

  describe('#titlecase_name') do
    it('capitalizes the first letter of each word of the venue name') do
      test_venue = Venue.create({:name => "the silly willies"})
      expect(test_venue.name()).to(eq("The Silly Willies"))
    end
  end

end
