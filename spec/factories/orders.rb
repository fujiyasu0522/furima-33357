FactoryBot.define do
  factory :order do
    postal_code       {'123-4567'}
    delivery_area_id  {3}
    city_name         {'草加市'}
    block_name        {'1-1-1'}
    building          {'建物ビル'}
    phone_number      {'09022223333'}
  end
end
