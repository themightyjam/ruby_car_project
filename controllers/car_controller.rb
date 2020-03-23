require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/car')
require_relative('../models/manufacturer')
also_reload('../models/*')

get '/cars' do
  @cars = Car.all
erb(:"cars/index")
end
