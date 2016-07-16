class AddToBasket

  def initialize( params )
    @product_id = params.fetch( "product_id" ).to_i
    @quantity = params.fetch( "quantity" ).to_i
  end

  def call
     product = find_product_in_basket( @product_id )
     if product.nil?
      BASKET << Basket.new(
      product_id: @product_id,
      quantity: @quantity )
     else
       product.quantity = product.quantity + @quantity
     end
  end

  def find_product_in_basket( product_id )
    BASKET.find do |product_in_basket|
      product_in_basket.product_id == product_id
    end
  end

end
