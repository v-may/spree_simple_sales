module Spree
  module ProductsHelper
    # returns the formatted price for the specified variant as a difference from product price
    def variant_price_diff(variant)
      variant_price = variant.price_in(current_currency)
      return if variant_price.nil?
      
      product_price = variant.product.price_in(current_currency)
      return if product_price.nil?

      variant_price = variant_price.price
      product_price = product_price.price
      return if  variant_price == product_price

      diff = variant_price - product_price
      price = Spree::Money.new(diff.abs, currency: current_currency).to_html
      label  = diff > 0 ? :add : :subtract
      "(#{Spree.t(label)}: #{price})".html_safe
    end
  end
end