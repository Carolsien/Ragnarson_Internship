require "sinatra/base"
require "pry"
require_relative "lib/models/product"
require_relative "lib/models/basket"
require_relative "lib/services/fetch_basket"
require_relative "lib/services/fetch_product"
require_relative "lib/services/fetch_products"
require_relative "lib/services/add_to_basket"
require_relative "lib/services/delete_from_basket"


PRODUCTS = [
  Product.new( id: 1, name: "1tea", price: 7, quantity: 1 ),
  Product.new( id: 2, name: "2coffee", price: 8, quantity: 1 ),
  Product.new( id: 3, name: "3tea", price: 7, quantity: 1 ),
  Product.new( id: 4, name: "4coffee", price: 8, quantity: 1 ),
  Product.new( id: 5, name: "5tea", price: 7, quantity: 1 ),
  Product.new( id: 6, name: "6coffee", price: 8, quantity: 1 ),
  Product.new( id: 7, name: "7tea", price: 7, quantity: 1 ),
  Product.new( id: 8, name: "8coffee", price: 8, quantity: 1 ),
  Product.new( id: 9, name: "9tea", price: 7, quantity: 1 ),
  Product.new( id: 10, name: "10coffee", price: 8, quantity: 1 )

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
    redirect "/products"
  end

  post "/basket/delete" do
    DeleteFromBasket.new(params).call
    redirect "/products"
  end

end
