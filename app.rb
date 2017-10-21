require('sinatra')
require('sinatra/contrib/all')
require_relative('cotrollers/contorller.rb')


get '/' do
  erb (:index)
end
