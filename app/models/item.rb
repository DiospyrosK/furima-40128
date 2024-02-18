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

  belongs_to :user
end
