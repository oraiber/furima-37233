FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address1 { '123-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
