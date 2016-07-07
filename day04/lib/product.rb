class Product
  attr_reader :name, :price

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def name
    @name = set_name
  end

  private

  def set_name
    if @name.class == String
      @name
    else
      raise ArgumentError
    end
  end
end
