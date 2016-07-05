product1 = {
  id: 1,
  name: "Pen",
  price: 1.2,
  quantity: 1
}

product2 = {
  id: 2,
  name: "Notebook",
  price: 2,
  quantity: 1
}

product3 = {
  id: 3,
  name: "Pencil",
  price: 1.5,
  quantity: 1
}

@products = [
  product1,
  product2,
  product3
]

@basket = []

def get_product_name
  @products.map { |product| product[:name] }.join(', ')
end

def get_product(product_name)
  @products.find{|product| product[:name] == product_name }
end

def choose_product
  puts "lists of products: #{get_product_name}"
  product = gets.chomp
  if get_product_name.include?(product)
    return get_product(product)
  else
    puts "There is no product with name #{product}"
  end
end

def add(product)
  if product != nil
    @basket << product
  end
end

def add_product_to_basket
  product_to_add = choose_product
  add(product_to_add)
end

def delete_product_from_basket
  product = choose_product
  @basket.delete(product)
end

def show_basket
  puts @basket
end

def show_products
  puts "lists of products: #{get_product_name}"
end


def menu
  puts "Possible actions
  1. Show list of products
  2. Add product to your basket
  3. Delete product from basket
  4. Show products in basket
  5. Exit"

  action = nil
  until action == 6
    action = $stdin.gets.chomp.to_i
    case action
    when 1
      show_products
    when 2
      add_product_to_basket
    when 3
      delete_product_from_basket
    when 4
      show_basket
    end
  end
end

menu
