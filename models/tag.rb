require_relative('../db/sql_runner')

class Tag

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options
  end

  def save
    sql = "
    INSERT INTO tag
    (
    name
    )
    VALUES
    (
    1$
    )
    RETURNING id
    "
    values = [@name]
    results = SqlRunner.new (sql, values)
    @id = results.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map {|tag| Tag.new(tag)}
  end

end
