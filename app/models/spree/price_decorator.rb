module PriceExtensions
  extend ActiveSupport::Concern

  included do 
    validate :validate_sale_price_maximum

    alias_method :original_price, :price
    alias_method :original_price=, :price=

    def display_price
      money price
    end

    def display_sale_price
      money sale_price if on_sale?
    end

    def display_original_price
      money original_price
    end

    def money(value = price)
      Spree::Money.new(value || 0, { currency: currency })
    end

    def price
      on_sale? ? sale_price : original_price
    end

    def price=(price)
      self[:amount] = Spree::LocalizedNumber.parse(price)
      self[:sale_price] = nil
    end

    def on_sale?
      sale_price.present?
    end

    private

    def maximum_sale_price
      BigDecimal '999999.99'
    end

    def validate_sale_price_maximum
      if sale_price && sale_price > maximum_sale_price
        errors.add :sale_price, I18n.t('errors.messages.less_than_or_equal_to', count: maximum_sale_price)
      end
    end
  end
end

Spree::Price.include PriceExtensions