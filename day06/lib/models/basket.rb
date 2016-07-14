class Basket
  attr_reader :product_id
  attr_accessor :quantity

  def initialize( product_id:, quantity: )
    @product_id = product_id
    @quantity = quantity
  end

  def all
      FetchProduct.new.call( product_id )
  end

  def total_price
    product = all
    product.price * quantity
  end
  
end
