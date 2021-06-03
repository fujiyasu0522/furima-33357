FactoryBot.define do
  factory :item do
    item_name          {Faker::Name.initials}
    description        {Faker::Lorem.sentence}
    category_id        {'2'}
    status_id          {'2'}
    delivery_cost_id   {'2'}
    delivery_area_id   {'2'}
    delivery_days_id   {'2'}
    price              {'1000'}
    association :user  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
