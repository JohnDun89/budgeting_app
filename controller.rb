require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/transaction.rb' )
require_relative( './models/merchant.rb' )
require_relative( './models/tag.rb' )
require_relative( './models/quotes.rb')


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
  @transaction = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb (:add)
end

post '/cashboard' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect '/success'
end

get '/success' do
  @quotes = Quotes.all
  erb (:success)
end

get '/cashboard/filter_tag' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb (:filter_tag)
end

get '/cashboard/filter_merchant' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  erb (:filter_merchant)
end

post '/cashboard/tag' do
  @transactions = Transaction.find_by_tag(params["tag"])
  erb(:show)             # passing back to our table - why re create a table when we hae a perfectly good oene here
end

post '/cashboard/merchant' do
  @transactions = Transaction.find_by_merchant(params["merchant"])
  erb(:show)
end
