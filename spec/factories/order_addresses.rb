FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture { 2 }
    city { '東京都' }
    address1 { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 08012345678 }
  end
end
