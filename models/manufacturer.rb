require_relative('../db/sql_runner')

class Manufacturer

  attr_reader :name, :year_formed

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @year_formed = options['year_formed']
end 
