class CreateShippingPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_prices do |t|

      t.timestamps
    end
  end
end
