Deface::Override.new(
  :virtual_path => 'spree/products/_cart_form',
  :name => 'add_original_price_to_product_variant',
  :insert_before => "erb[silent]:contains('if variant_price')",
  :text => '
    <span class="old price">
      <%= display_original_price(variant) if variant.on_sale?%>
    </span>
  ')

Deface::Override.new(
  :virtual_path => 'spree/products/_cart_form',
  :name => 'add_original_price_to_product_list',
  :insert_after => "span.price.selling",
  :text => '
    <span class="old price">
      <%= display_original_price(@product) if @product.on_sale? and @product.variants_and_option_values(current_currency).none?%>
    </span>
  ')


