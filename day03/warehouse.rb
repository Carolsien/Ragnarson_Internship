class Warehouse
  require_relative './product'

  def make_list
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

    @list_of_products = [
      product1,
      product2,
      product3
    ]
  end
end
