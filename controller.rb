require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/transaction.rb' )
require_relative( './models/merchant.rb' )
require_relative( './models/tag.rb' )


get '/cashboard' do
  @transactions_for_total = Transaction.all
  erb (:index)
end

get '/cashboard/show' do
  @transactions = Transaction.all
  erb (:show)
end
