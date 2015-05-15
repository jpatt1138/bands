require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/') do
  @bands = Band.all()
  name = params.fetch("name")
  new_band = Band.create(:name => name)
  redirect to('/')
end

get('/band/:id') do
  @id = params.fetch("id")
  @band = Band.find(params.fetch("id").to_i())
  @venues = @band.venues()
  erb(:band)
end

post('/band/:id') do
  @venues = Venue.all()
  @band = Band.find(params.fetch("id").to_i())
  name = params.fetch("name")
  new_venue = Venue.create(:name => name)
  new_venue.bands.push(@band)
  redirect to("/band/#{@band.id}")
end

delete('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all()
  redirect to ('/')
end
