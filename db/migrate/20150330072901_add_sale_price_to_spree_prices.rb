class AddSalePriceToSpreePrices < ActiveRecord::Migration
  def change
    add_column :spree_prices, :sale_price, :decimal, :precision => 8, :scale => 2
  end
end
