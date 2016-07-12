class Basket
  attr_reader :product_id, :quantity

  def initialize(product_id:, quantity:)
    @product_id = product_id
    @quantity = quantity
  end

  def all
      FetchProduct.new.call(product_id)
  end
end
