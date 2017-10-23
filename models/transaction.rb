require_relative('../db/sql_runner')
require_relative('../db/sql_runner')


class Transaction

  attr_reader :id
  attr_accessor :amount, :spend_date, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @spend_date = options['spend_date']
    @tag_id = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

#-------------------------------------------  CRUD METHODS  -------------------->

  def save
    sql = " INSERT INTO transactions
    (
    amount,
    spend_date,
    tag_id,
    merchant_id
    )
    VALUES
    (
    $1, $2, $3, $4
    )
    RETURNING id"
    values = [@amount, @spend_date, @tag_id, @merchant_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map {|transaction| Transaction.new(transaction)}
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run( sql, values)
  end

  def delete(id)
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, runner )
  end

  def update
    sql = "UPDATE transactions SET
    (
    amount,
    spend_date,
    tag_id,
    merchant_id
    ) =
    (
    $1, $2, $3, $4
    ) WHERE id = $5
    "
    values = [@amount, @spend_date, @tag_id, @merchant_id, @id]
    SqlRunner.run(sql, values)
  end
#------------------------------------------   FINDING METHODS ----------------->

  def find_merchant
    sql = "SELECT FROM merchants
    WHERE id = $1"
    vaulues = [@merchant_id]
    results = SqlRunner.run( sql, values)
    return Merchant.new( results.first )
  end

  def self.find_transaction_id(id) #static method. these are related to a transaction but not a specific instance of a transaction as you pass that in.
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
    return Transaction.new( results.first )
  end


  def find_tag()
    sql = "SELECT FROM tags
    WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    return Tag.new( results,first )
  end

  def self.find_merchant_name(name)
    sql = "SELECT merchants.name, transactions.* FROM merchants
    INNER JOIN transactions
    ON merchants.id = transactions.merchant_id
    WHERE name = $1"
    values = [name]
    results = SqlRunner.run(sql, values)
    return results.map {|merchant| Transaction.new(merchant)}
  end


  def self.find_tag_name(name)
    sql = "SELECT tags.name, transactions.* FROM tags
    INNER JOIN transactions
    ON tags.id = transactions.tag_id
    WHERE name = $1"
    values = [name]
    results = SqlRunner.run(sql, values)
    return results.map {|tag| Transaction.new(tag)}
  end
#------------------------------------------  OTHER CLASS METHODS -------------->




  def current_time
    time = Time.new
    return time
  end
end
