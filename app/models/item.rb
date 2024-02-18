class Item < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_price_id
    validates :shipping_area_id
    validates :shipping_date_id
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_area, :shipping_price, :shipping_date
  belongs_to :user
end
