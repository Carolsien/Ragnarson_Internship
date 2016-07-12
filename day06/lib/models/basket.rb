class Basket
  attr_reader :product_id, :quantity

  def initialize(product_id:, quantity:)
    @product_id = product_id
    @quantity = quantity
  end

  def all
    {
      product: PRODUCTS.find{|product| product.id.to_i == @product_id.to_i },
      quantity: @quantity
    }
  end
end
