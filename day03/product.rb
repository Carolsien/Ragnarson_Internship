class Product
  attr_reader :name, :price, :quantity

  @@id = 0

  def initialize(name: , price: , quantity:)
    @id = next_id
    @name = name
    @price = price
    @quantity = quantity
  end

  private
  def next_id
    @@id = @@id + 1
  end

end
