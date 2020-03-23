require_relative('../db/sql_runner')

class Car

  attr_reader :name, :year_made, :buying_cost, :selling_price, :stock, :id
  attr_accessor :manufacturer_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @year_made = options['year_made']
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
    @stock = options['stock']
    @manufacturer_id = options['manufacturer_id'].to_i
  end

def save()
  sql = "INSERT INTO cars
  (
    name,
    year_made,
    buying_cost,
    selling_price,
    stock,
    manufacturer_id
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@name, @year_made, @buying_cost, @selling_price, @stock, @manufacturer_id]
    car_data = SqlRunner.run(sql, values)
    @id = car_data.first()['id'].to_i
  end

def manufacturer()
  manufacturer = Manufacturer.find(@manufacturer_id)
  return manufacturer
end

def self.find(id)
  sql = "SELECT * FROM cars
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  car = Car.new(result)
  return car
end

def update()
  sql = "UPDATE cars set
    (
    name,
    year_made,
    buying_cost,
    selling_price,
    stock,
    manufacturer_id
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @year_made, @buying_cost, @selling_price, @stock, @manufacturer_id]
    SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM cars
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "Select * FROM cars"
  car_data = SqlRunner.run(sql)
  cars = map_items(car_data)
  return cars
end

def self.map_items(car_data)
  return car_data.map { |car| Car.new(car)}
end

def self.find(id)
  sql = "SELECT * FROM cars
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  car = Car.new(result)
  return car
end
end
