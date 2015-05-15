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
