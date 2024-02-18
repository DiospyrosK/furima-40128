class Item < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_price_id
    validates :shipping_area_id
    validates :shipping_date_id
    validates :price, numericality: { in: 300..9,999,999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_price_id
    validates :shipping_area_id
    validates :shipping_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_area, :shipping_price, :shipping_date
  belongs_to :user
end
