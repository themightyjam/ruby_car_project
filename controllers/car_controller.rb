require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/car.rb')
require_relative('../models/manufacturer.rb')
also_reload('../models/*')

get '/cars' do
  @cars = Car.all()
erb(:"cars/index")
end

get '/cars/new' do
  erb  (:"cars/new")
end

get '/cars/:id' do
  @car = Car.find(params['id'].to_i)
  erb(:"cars/show")
end

get '/cars/:id/edit' do
  @car = Car.find( params[:id] )
  @manufacturer = Manufacturer.find(@car.manufacturer_id)
  erb( :"cars/edit" )
end

post '/cars/:id' do
  Car.new(params).update
  redirect to '/cars'
end
