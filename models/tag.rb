require_relative('../db/sql_runner')

class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "
    INSERT INTO tags
    (
    name
    )
    VALUES
    (
    $1
    )
    RETURNING id
    "
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags"
    values = []
    results = SqlRunner.run( sql, values )
    all_tags = results.map {|tag| Tag.new(tag)}
    return all_tags
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    values = []
    SqlRunner.run( sql, values )
  end

  def update
    sql ="UPDATE tags SET
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

  def self.find_tag_name(name)
    sql = "SELECT * FROM tags
    WHERE name = $1"
    values = [name]
    results = SqlRunner.run(sql, values)
    return results.map {|tag| Tag.new(tag)}
  end



end
