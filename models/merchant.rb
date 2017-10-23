require_relative('../db/sql_runner')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "
    INSERT INTO merchants
    (
    name
    )
    VALUES
    (
    $1
    )
    RETURNING *
    "
    values = [@name]
    results = SqlRunner.run( sql, values )
    @id = results.first['id'].to_i
  end

  def self.all
    sql ="SELECT * FROM merchants"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map{|mercahant| Merchant.new(mercahant)}
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    values = []
    SqlRunner.run( sql, values )

  end
  def update
    sql ="UPDATE merchants SET
    (
    name
    ) =
    (
    $1
    ) WHERE id = $2
    "
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end



end
