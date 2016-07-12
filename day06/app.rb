require "sinatra/base"
require_relative "lib/models/product"
require_relative "lib/models/basket"
require_relative "lib/services/fetch_basket"
require_relative "lib/services/fetch_product"
require_relative "lib/services/fetch_products"
require_relative "lib/services/add_to_basket"


PRODUCTS = [
  Product.new( id: 1, name: "tea", price: 7, quantity: 1 ),
  Product.new( id: 2, name: "coffee", price: 8, quantity: 1 )

]

BASKET = []

class App < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/products" do
    @products = FetchProducts.new.call
    erb :list_of_products
  end

  get "/products/:id" do |id|
    @product = FetchProduct.new.call(id)
    erb :show_product
  end

  get "/basket" do
    products_in_basket = FetchBasket.new.call
    erb :show_basket, locals: { basket: products_in_basket }
  end

  post "/basket" do
    AddToBasket.new(params).call
    redirect "/"
  end

end
