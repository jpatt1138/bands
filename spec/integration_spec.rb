ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
# set(:show_exceptions, false)

describe('the adding of bands path') do
  it("adds a band to the database and displays it on the page") do
    visit('/')
    fill_in("band", with => "The Hollowpoints")
    click_button('Lets Rock!')
    expect(page).to have_content("The Hollowpoints")
  end
end

# NOTE TO MY TEACHERS
#
# 1. I feel as though RESTful routing is being followed with my erb files.
#   Seeing as the index is doing the job of what would normally be called
#   "bands" the page called "band" pertains to a singular band. Please
#   inform me if the case is otherwise.

# 2. As far as the unit testing goes "it { should validate(:name, :presence => true) }"
#   wasn't getting me anywhere. "it { should validate_presence_of(:name) }" seems to be
#   the proper syntax. Not to give you any guff, just to prevent the circulation of
#   potentially incorrect information :)
#
# 3. I've been working really hard in class and out, and I recognize that this submittal
#   does not satisfy every issue that has been brought up, but I hope that the effort to
#   correct my mistakes is recognized. Going to class as a full time job takes its toll
#   on other obligations one encounters in every day life, and I hope that you can appreciate
#   that I am doing my due diligence in completeing this course and trying to become the
#   best programer that I can be. If this needs to be resubmitted once again I completely
#   understand.
#
# 4. For some reason that I simply can't get my head around I cannot get
#   integration testing to work to save my soul.  I am quite positive that
#   it is an oversite on my part but I feel as though I've been beating
#   my head against the wall to no avail. Please let me know what I'm missing.
#   Thanks for all the help!
