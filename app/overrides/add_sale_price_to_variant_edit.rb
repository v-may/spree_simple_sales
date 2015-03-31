Deface::Override.new(
  :virtual_path => 'spree/admin/variants/_form',
  :name => 'replace_price_on_variant_edit',
  :replace => "[data-hook = 'price']",
  :text => '
    <div class="field" data-hook="price">
      <%= f.label :original_price, Spree.t(:original_price) %>
      <%= f.text_field :original_price, :value => number_to_currency(@variant.original_price, :unit => ""), :class => "fullwidth" %>
    </div>
  ')

Deface::Override.new(:virtual_path => 'spree/admin/variants/_form',
  :name => 'add_sale_price_to_product_edit',
  :insert_after => "[data-hook = 'price']",
  :text => '
    <div class="field" data-hook="sale_price">
      <%= f.label :sale_price, Spree.t(:sale_price) %>
      <%= f.text_field :sale_price, :value => number_to_currency(@variant.sale_price, :unit => ""), :class => "fullwidth"  %>
    </div>
  ')
