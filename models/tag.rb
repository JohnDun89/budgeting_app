require_relative('../db/sql_runner')

class Tag

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options 
  end


end
