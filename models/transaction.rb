require_relative('../db/sql_runner')

class Transaction

  def initialize
    @id = options['id'].to_i if options['id']
    @amount options['to_i']
    @date = options['date']
    @transaction_id = options['transaction_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save
    sql = " INSERT INTO transactions
    (
    amount,
    date,
    transaction_id,
    tag_id
    )
    VALUES
    (
    1$, $2, 3$, 4$
    )
    RETURNING id"
    values = [@amount, @date, @transaction_id, @tag_id]
    results = SqlRunner.new( sql, values)
    @id = results.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map {|transaction| Transaction.new(transaction)}
  end
end
