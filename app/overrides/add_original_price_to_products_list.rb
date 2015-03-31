Deface::Override.new(
  :virtual_path => 'spree/shared/_products',
  :name => 'add_original_price_to_product_list',
  :insert_after => "span.price.selling",
  :text => '
    <span class="old price">
      <%= display_original_price(product) if product.on_sale?%>
    </span>
  ')


