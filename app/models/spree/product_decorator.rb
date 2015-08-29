module ProductExtensions
  extend ActiveSupport::Concern

  included do 
    delegate_belongs_to :master, 
                          :sale_price, :original_price, :on_sale?,
                          :display_sale_price, :display_original_price

    add_search_scope :ascend_by_master_price do
      joins(:master => :default_price).order("coalesce(#{price_table_name}.sale_price, #{price_table_name}.amount) ASC")
    end

    add_search_scope :descend_by_master_price do
      joins(:master => :default_price).order("coalesce(#{price_table_name}.sale_price, #{price_table_name}.amount) DESC")
    end
  end
end

Spree::Product.include ProductExtensions