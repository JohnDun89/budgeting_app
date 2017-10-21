require_relative('../db/sql_runner')

class Transaction

  def initialize
    @id = options['id'].to_i if options['id']
    @amount options['to_i']
    @date = options['date']
    @transaction_id = options['transaction_id'].to_i
    @tag_id = options['tag_id'].to_i
  end


end
