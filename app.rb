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

get('/bands/:id') do
  @id = params.fetch("id")
  @band = Band.find(params.fetch("id").to_i())
  @venues = @band.venues()
  erb(:bands)
end

post('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = @band.venues()
  if params[:name] || params[:new_venue_type] || params[:new_band_name]
    if params[:name]
      names = params.fetch("name")
      names.each() do |name|
        new_venue = Venue.create(:name => name)
        new_venue.bands.push(@band)
      end
    end
    if params[:new_venue_type]
     new_venue_type = params.fetch("new_venue_type")
     brand_new_venue = Venue.create({:name => new_venue_type})
     brand_new_venue.bands.push(@band)
    end
    if params[:new_band_name]
      new_band_name = params.fetch("new_band_name")
      @band.update({:name => new_band_name})
    end
      redirect to("/bands/#{@band.id}")
  else
    erb(:error)
  end

end

delete('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all()
  redirect to ('/')
end
