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
      if @name.length > 2
        @name
      else
        raise ArgumentError
      end
    else
      raise ArgumentError
    end
  end
end
