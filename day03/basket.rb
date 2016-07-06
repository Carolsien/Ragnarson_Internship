# => TODO
# => add_product_to_basket
# => delete_product_from_basket
# => show_basket
# => storage (how many product we have avaible)
# => total price in basket + tax

class Basket
  require_relative "./product"
  require_relative "./products"
  attr_reader :products

  def get_list
    list = Products.new
    @make = list.make_list
  end

  def choose_product
    show_products
    puts "Choose a product"
    product = gets.chomp
    puts "Your choice is: " + product
    if get_product_name.include?(product)
      return get_product(product)
    else
      puts "There is no product with name #{product}"
    end
  end

  def add_product_to_basket
    product_to_add = choose_product
    if product_to_add != nil
      puts "How many of this item would you like to have? "
      how_many = gets.chomp.to_i
      if how_many <= 0
        puts "You can not add less than 0 items or 0 items"
      else
        add(product_to_add)
        product_to_add[:quantity] = how_many
      end
    end
  end

  def delete_product_from_basket
    product = choose_product
    if @basket.empty?
      puts "You can not delete anything"
    elsif product[:quantity] >= 2
      puts "How many of this item would you like to delete? "
      how_many = gets.chomp.to_i
      if how_many <= 0
        puts "You can not delete less than 0 items or 0 items"
      else
        product[:quantity] = product[:quantity] - how_many
      end
    else
      @basket.delete(product)
    end
  end

  def show_basket
    if !@basket.empty?
      puts @basket
    else
      puts "Your basket is empty"
    end
  end

  def show_products
    puts "lists of products: #{get_product_name}"
  end

  private
    def get_product_name
      #Products.new.map(&:name)
      get_list.map{ |products| products[:name] }.join(', ')
    end

    def get_product(product_name)
      get_list.find{|products| products[:name] == product_name }
    end

    def add(product)
      if product != nil
        @basket << product
      end
    end

end

basket = Basket.new
p basket.choose_product
