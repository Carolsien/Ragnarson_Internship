class Main
  attr_reader :action

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
