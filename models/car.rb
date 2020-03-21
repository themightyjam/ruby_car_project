require_relative('../db/sql_runner')

class Car

  attr_reader :name, :year_made, :buying_cost, :selling_price, :stock
  attr_accessor :manufacturer_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @year_made = options['buying_cost']
    @selling_price = options['selling_price']
    @stock = options['stock']
    @manufacturer_id = options['manufacturer_id'].to_i
  end
