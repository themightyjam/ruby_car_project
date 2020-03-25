require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/car.rb')
require_relative('../models/manufacturer.rb')
also_reload('../models/*')

get '/cars' do
  @cars = Car.all()
erb(:"cars/index") #index
end

get '/cars/new' do
  @manufacturers = Manufacturer.all()
  erb  (:"cars/new") #new
end

get '/cars/:id' do
  @car = Car.find(params['id'].to_i)
  erb(:"cars/show") #show
end

post '/cars' do
  @car = Car.new(params)
  @car.save()
  redirect to '/cars'      #create
end

get '/cars/:id/edit' do
  @manufacturers = Manufacturer.all
  @car = Car.find( params['id'] )
  erb( :"cars/edit" )  #edit
end

post '/cars/:id' do
  Car.new(params).update
  redirect to '/cars' #update
end

post '/cars/:id/delete' do # delete
  stock = Car.find( params[:id] )
  stock.delete()
  redirect to '/cars'
end
