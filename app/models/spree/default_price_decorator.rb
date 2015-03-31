module DefaultPriceExtensions
  extend ActiveSupport::Concern

  included do 
    delegate_belongs_to :default_price, 
                        :sale_price, :sale_price=, :on_sale?,
                        :original_price, :original_price=, 
                        :display_sale_price, :display_original_price
  end
end

Spree::Variant.include DefaultPriceExtensions
