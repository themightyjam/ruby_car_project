require_relative('../db/sql_runner')

class Car

  attr_reader :name, :year_made, :buying_cost, :selling_price, :stock
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

def cars
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
