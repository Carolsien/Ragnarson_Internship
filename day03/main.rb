# => TODO
# => delete_product_from_basket
# => show_basket
# => storage (how many product we have avaible)
# => total price in basket + tax


class Main
  require_relative "./product"
  require_relative "./warehouse"
  require_relative "./basket"

  attr_reader :action

  def get_list
    list = Warehouse.new
    @make = list.make_list
  end

  def get_basket
    bas = Basket.new
    @basket = bas.create_basket
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
    p "ADD A PRODUCT"
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
    p "DELETE A PRODUCT"
    product = choose_product
    p "PQ #{product[:quantity]}"
    if @basket.size == 0
      puts "You can not delete anything because your basket is empty"
    elsif product[:quantity] >= 2
      p "aaaa"
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

  def menu
    puts "Possible actions
    1. Show list of products
    2. Add product to your basket
    3. Delete product from basket
    4. Show products in basket
    5. Exit"

    until action == 6
      puts ""
      puts "Please enter a number of action"
      @action = action
      case action
      when 1
        show_products
      when 2
        add_product_to_basket
      when 3
        delete_product_from_basket
      when 4
        show_basket
      when 5
        break
      end
    end
  end
end


main = Main.new
main.choose_product
main.get_basket
main.add_product_to_basket
main.add_product_to_basket
main.show_basket
main.delete_product_from_basket
main.show_basket
