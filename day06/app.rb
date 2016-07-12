require "sinatra/base"
require_relative "lib/product"

class Products
  def call
    [
      Product.new(id: 1, name: "tea"),
      Product.new(id: 2, name: "coffee")
    ]
  end
end

class App < Sinatra::Base

  get "/" do
    @products = Products.new.call
    erb :index
  end


  get "/products" do
    @products = Products.new.call
    erb :list_of_products
  end

  get "/products/:id" do
    @product = Products.new.call.find{ |product| product.id.to_i == params[:id].to_i}
    erb :show
  end

end
