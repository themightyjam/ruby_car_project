require_relative('../db/sql_runner')

class Manufacturer

  attr_reader :name, :year_formed, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @year_formed = options['year_formed']
end

def save()
  sql = "INSERT INTO manufacturers
  (
  name,
  year_formed
  )
  VALUES
  (
      $1, $2
  )
  RETURNING *"
  values = [@name, @year_formed]
  manufacturer_data = SqlRunner.run(sql, values)[0]
  @id = manufacturer_data['id'].to_i
end

def self.find(id)
  sql = "SELECT * FROM manufacturers
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  manufacturer = Manufacturer.new(result)
  return manufacturer
end

def self.all()
  sql = "SELECT * FROM manufacturers"
  manufacturer_data = SqlRunner.run(sql)
  manufacturers = map_items(manufacturer_data)
  return manufacturer
end

def self.map_items(manufacturer_data)
  return manufacturer_data.map { |manufacturer| Manufacturer.new(manufacturer)}
end
