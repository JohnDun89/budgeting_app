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

tag_5 = Tag.new({"name" => "cloths"})
tag_5.save

tag_6 = Tag.new({"name" => "cloths"})
tag_6.save

tag_7 = Tag.new({"name" => "Miscellaneous Shop"})
tag_7.save

merchant_1 = Merchant.new({"name" => "Tesco"})
merchant_1.save

merchant_2 = Merchant.new({"name" => "The Blue Blazer"})
merchant_2.save

merchant_3 = Merchant.new({"name" => "Starbucks"})
merchant_3.save

merchant_4 = Merchant.new({"name" => "Miscellaneous Shop"})
merchant_4.save

merchant_5 = Merchant.new({"name" => "Assos"})
merchant_5.save

merchant_6 = Merchant.new({"name" => "Edinburgh Bicycle Co-Operative"})
merchant_6.save


transaction_1 = Transaction.new({
  "amount" => "5",
  "spend_date" => "2017-06-10",
  "merchant_id" => merchant_1.id,
  "tag_id" => tag_2.id
  })
  transaction_1.save


  transaction_2 = Transaction.new({
    "amount" => "3",
    "spend_date" => "2017-06-10",
    "merchant_id" => merchant_2.id,
    "tag_id" => tag_4.id
    })
    transaction_2.save

    transaction_3 = Transaction.new({
      "amount" => "7",
      "spend_date" => "2017-06-10",
      "merchant_id" => merchant_5.id,
      "tag_id" => tag_5.id
      })
      transaction_3.save

      transaction_4 = Transaction.new({
        "amount" => "2",
        "spend_date" => "2017-06-10",
        "merchant_id" => merchant_1.id,
        "tag_id" => tag_3.id
        })
        transaction_3.save
        binding.pry
        nil
