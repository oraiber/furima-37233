FactoryBot.define do
  factory :item do
    item_name     {'名前'}
    text          {Faker::Lorem.sentence}
    item_condition_id  {2}
    category_id        {2}
    delivery_charge_id {2}
    area_id            {2}
    days_id            {2}
    price           {2000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end