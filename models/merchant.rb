require_relative('../db/sql_runner')

class Merchant

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options
  end

  def save
    sql = "
    INSERT INTO merchants
    (
    name
    )
    VALUES
    (
    1$
    )
    "
    values = [@name]
    results = SqlRunner.new( sql, values )
    @id = results.first['id'].to_i
  end

  def self.all
    sql ="SELECT * FROM merchants"
    values = []
    results = SqlRunner.new( sql, values )
    return results.map{|mercahant| Merchant.new(mercahant)}
  end

end
