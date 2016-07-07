class Product
  attr_reader :name, :price

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end
end
