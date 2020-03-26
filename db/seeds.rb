require_relative('../models/car')
require_relative('../models/manufacturer')

Car.delete_all()
Manufacturer.delete_all()

manufacturer1 = Manufacturer.new({
  "name" => "Mclaren",
  "year_formed" => 1963
})

manufacturer2 = Manufacturer.new({
  "name" => "ferrari",
  "year_formed" => 1939
})

manufacturer3 = Manufacturer.new({
  "name" => "Mercedes",
  "year_formed" => 1923
  })

manufacturer1.save()
manufacturer2.save()
manufacturer3.save()

car1 = Car.new({
  "name" => "mp4/13",
  "year_made" => 1998,
  "buying_cost" => 100000,
  "selling_price" => 300000,
  "stock" => 2,
  "manufacturer_id" => manufacturer1.id
  })


car2 = Car.new({
  "name" => "mp4/4",
  "year_made" => 1988,
  "buying_cost" => 5000000,
  "selling_price" => 10000000,
  "stock" => 1,
  "manufacturer_id" => manufacturer1.id
  })

car3 = Car.new({
  "name" => "f2004",
  "year_made" => 2004,
  "buying_cost" => 2500000,
  "selling_price" => 5000000,
  "stock" => 3,
  "manufacturer_id" => manufacturer2.id
})

car4 = Car.new({
    "name" => "126C",
    "year_made" => 1981,
    "buying_cost" => 2000000,
    "selling_price" => 4000000,
    "stock" => 3,
    "manufacturer_id" => manufacturer2.id
    })

        car5 = Car.new({
          "name" => "W09",
          "year_made" => 2018 ,
          "buying_cost" => 1000000,
          "selling_price" => 2000000,
          "stock" => 4,
          "manufacturer_id" => manufacturer3.id
          })

          car6 = Car.new({
            "name" => "W196",
            "year_made" => 1955 ,
            "buying_cost" => 8000000,
            "selling_price" => 16000000,
            "stock" => 1,
            "manufacturer_id" => manufacturer3.id
            })
car1.save()
car2.save()
car3.save()
car4.save()
car5.save()
car6.save()
