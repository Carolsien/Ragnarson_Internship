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

  def price
    @price = set_price
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

  def set_price
    if @price.is_a?(Numeric)
      if @price > 0 && @price < 10000
        @price
      else
        raise ArgumentError
      end
    else
      raise ArgumentError
    end
  end
end
