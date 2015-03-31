module ProductExtensions
  extend ActiveSupport::Concern

  included do 
    delegate_belongs_to :master, 
                          :sale_price, :original_price, :on_sale?,
                          :display_sale_price, :display_original_price
  end
end

Spree::Product.include ProductExtensions