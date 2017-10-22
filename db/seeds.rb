require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')
require('pry')

tag_1 = Tag.new({"name" => "coffee"})
tag_1.save

tag_2 = Tag.new({"name" => "shop"})
tag_2.save

tag_3 = Tag.new({"name" => "petrol"})
tag_3.save

tag_4 = Tag.new({"name" => "socialising"})
tag_4.save

merchant_1 = Merchant.new({"name" => "Tesco"})
merchant_1.save

merchant_2 = Merchant.new({"name" => "The Blue Blazer"})
merchant_2.save

merchant_3 = Merchant.new({"name" => "Starbucks"})

binding.pry
nil
