require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')
require('pry')

Tag.delete_all
Merchant.delete_all
Transaction.delete_all

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
merchant_3.save

 transaction_1 = Transaction.new({
   "amount" => "5",
   "spend_date" => "2017-06-10",
   "merchant_id" => merchant_1.id,
   "tag_id" => tag_1.id
   })
   transaction_1.save
  binding.pry
  nil
