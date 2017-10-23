require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/transaction.rb' )
require_relative( './models/merchant.rb' )
require_relative( './models/tag.rb' )


get '/cashboard' do
  @spend = Transaction.total_spent
  @amount = Transaction.get_budget
  erb (:index)
end

get '/cashboard/show' do
  @transactions = Transaction.all
  erb (:show)
end

get '/cashboard/add' do
  @transaction = Transaction.new
  @transaction.save
  erb (:created)
end
