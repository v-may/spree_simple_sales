module Spree
  module BaseHelper
    def display_original_price(product_or_variant)
      product_or_variant.price_in(current_currency).display_original_price.to_html
    end
  end
end