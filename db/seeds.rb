require_relative('../models/transaction')
require('pry')

tag_1 = Tag.new({'name' => 'coffee'})
tag_1.save

tag_2 = Tag.new({'name' => 'tesco shop'})
tag_2.save

binding.pry
nil
