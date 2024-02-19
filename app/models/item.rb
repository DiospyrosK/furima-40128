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
    validates :price, numericality: { in: 300..9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_price_id
    validates :shipping_area_id
    validates :shipping_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_price
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image
end
