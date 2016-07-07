class Product
  attr_reader :name, :price

  @@id = 0

  def initialize(name, price, quantity)
    @id = next_id
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

  def quantity
    @quantity = set_quantity
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

  def set_quantity
    if @quantity.is_a?(Integer)
      @quantity
    else
      raise ArgumentError
    end
  end

  def next_id
    @@id = @@id + 1
  end
end
