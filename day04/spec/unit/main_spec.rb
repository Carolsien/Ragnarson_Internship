require_relative '../../lib/main.rb'

require 'pry'
RSpec.describe Main do


  let(:main) {
    Main.new
  }

  let(:product1){
    Product.new("Pen", 1.2, 1)
  }

  let(:product2){
    Product.new("Notebook", 2, 1)
  }

  let(:product3){
    Product.new("Pencil", 1.5, 1)
  }

  let(:basket) do [
    product1,
    Product.new("Notebook", 2, 1)
  ] end


  context ".choose_product" do

    it "returns a product" do
      allow(main).to receive(:gets).and_return("Pen")
      #binding.pry
      expect(main.choose_product).to be_a_kind_of(Hash)
    end

    it "choose existing product" do
      allow(main).to receive(:gets).and_return("Pen")
      #binding.pry
      expect(main.choose_product).to be_a_kind_of(Hash)
      expect(main.choose_product[:name]).to eq("Pen")
    end

  end

  context ".add_product_to_basket" do

    it "add product from warehouse" do
      double1 = double
      allow(main).to receive(:gets).and_return(double1)
      allow(double1).to receive(:chomp).and_return("Pen", 2)
      expect{main.add_product_to_basket}.to change{main.get_basket.size}.from(0).to(1)
    end

    it "add product from basket" do

    end
  end

  context ".delete_product_from_basket" do

    it "deletes product from basket" do

    end

    it "deletes one piece of the product from basket" do

    end

  end

  context ".show_basket" do

  end

  context ".get_basket" do
    it "returns an array" do
      expect(main.get_basket).to be_a_kind_of(Array)
    end

    it "returns empty basket" do
      expect(main.get_basket).to be_empty
    end

    it "returns one product" do
      prod = main.get_basket.find{|product| product[:name] == "Pen" }
    #  expect(main.add_product_to_basket).to eql()
    end

  end

  context ".show_products" do

    it "returns an array" do
      expect(main.get_list).to be_a_kind_of(Array)
    end

    it "returns 3 products" do
      expect(main.get_list.size).to eql(3)
    end

    it "returns products properly" do
      expect(main.get_list.find { |product| product[:name] == "Pen" }).to_not be_nil
      expect(main.get_list.find { |product| product[:name] == "Pencil" }).to_not be_nil
      expect(main.get_list.find { |product| product[:name] == "Notebook" }).to_not be_nil
    end

  end

end
