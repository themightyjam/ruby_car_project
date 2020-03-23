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
end
