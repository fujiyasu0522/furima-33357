FactoryBot.define do
  factory :order_form do
    token             {'tok_abcdefghijk00000000000000000'}
    postal_code       {'123-4567'}
    delivery_area_id  { 3 }
    city_name         {'草加市'}
    block_name        {'1-1-1'}
    building          {'建物ビル'}
    phone_number      {"09012345678"} 
    association :user
    association :item
  end
end
