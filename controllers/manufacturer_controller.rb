require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/car.rb')
require_relative('../models/manufacturer.rb')
also_reload('./models/*')


get '/manufacturer' do
  @manufacturers = Manufacturer.all()
erb(:"manufacturer/index")
end

get '/manufacturer/new' do
  erb (:"manufacturer/new")
end

get '/manufacturer/:id' do
  @manufacturer =  Manufacturer.find(params['id'].to_i)
  erb(:"manufacturer/show")
end

get '/manufacturer' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to '/manufacturer'
end
