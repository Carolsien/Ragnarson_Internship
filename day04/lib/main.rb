require_relative "./product"
require_relative "./warehouse"
require_relative "./basket"

class Main

  def initialize
    get_basket
    get_list
  end

  def get_list
    @get_list ||= Warehouse.new.make_list
  end

  def get_basket
    bas = Basket.new
    @basket ||= bas.create_basket
  end

  def choose_product(option = "add")
    show_products
    puts "Choose a product"
    product = gets.chomp
    puts "Your choice is: " + product
    if get_product_name.include?(product)
      if option == "add"
        get_product_from_warehouse(product)
      else
        get_product_from_basket(product)
      end
    end
  end

  def add_product_to_basket
    puts "ADD A PRODUCT"
    product_to_add = choose_product
    unless product_to_add.nil?
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
    puts "DELETE A PRODUCT"
    product = choose_product("delete")
    if @basket.size == 0
      puts "You can not delete anything because your basket is empty"
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
      basket = @basket.map do |product|
        "#{product[:name]} #{product[:quantity]}"
      end.join(' , ')
      puts basket
    else
      puts "Your basket is empty"
    end
  end

  def show_products
    puts "lists of products: #{get_product_name}"
  end

  private
    def get_product_name
      get_list.map{ |product| product[:name] }.join(', ')
    end

    def get_product_from_warehouse(product_name)
      get_list.find{ |product| product[:name] == product_name }
    end

    def get_product_from_basket(product_name)
      get_basket.find{ |product| product[:name] == product_name }
    end

    def add(product)
      if product != nil
        @basket << product
      end
    end

end


main = Main.new
