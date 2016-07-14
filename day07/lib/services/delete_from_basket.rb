class DeleteFromBasket

  def initialize( params )
    @product_id = params.fetch( "product_id" ).to_i
  end

  def call
    delete_product = fetch_basket_product( @product_id )
    return unless delete_product
    if delete_product.quantity > 1
      delete_product.quantity = delete_product.quantity - 1
    else
      BASKET.delete( delete_product )
    end
  end

  def fetch_basket_product( product_id )
    BASKET.find do |basket_product|
      basket_product.product_id == product_id
    end
  end

end
