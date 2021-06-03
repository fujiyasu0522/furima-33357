class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  # has_one :purchaser
  has_one_attached :image

  belongs_to :category
  belongs_to :delivery_area
  belongs_to :delivery_cost
  belongs_to :delivery_days

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    # validates :category_id, numericality: { other_than: 1 }
    # validates :status_id, numericality: { other_than: 1 }
    # validates :delivery_cost_id, numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 0 }
    # validates :delivery_days_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
      # 備忘録：半角の数字のみ保存可能、価格は300円から9,999,999円の間であること。
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :delivery_days_id
  end
end
