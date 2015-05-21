require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/') do
  @bands = Band.all()
  name = params.fetch("name")
  if name == ""
    erb(:error)
  else
    new_band = Band.create(:name => name.titlecase())
    redirect to('/')
  end
end

get('/band/:id') do
  @id = params.fetch("id")
  @band = Band.find(params.fetch("id").to_i())
  @venues = @band.venues()
  erb(:band)
end

post('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = @band.venues()
  if params[:name]
    names = params.fetch("name")
    names.each() do |name|
      new_venue = Venue.create(:name => name)
      new_venue.bands.push(@band)
    end
    redirect to("/band/#{@band.id}")
  else
    erb(:error)
  end
  if params[:new_venue]
    new_venue = params.fetch("new_venue")
    
end

delete('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all()
  redirect to ('/')
end
