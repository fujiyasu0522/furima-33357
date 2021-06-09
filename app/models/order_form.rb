class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :delivery_area_id, :city_name, :block_name, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :city_name
    validates :block_name
    validates :postal_code,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :phone_number,     format: { with: /\A\d{11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city_name: city_name, block_name: block_name, building: building, phone_number: phone_number, order_id: order.id)
  end
end
