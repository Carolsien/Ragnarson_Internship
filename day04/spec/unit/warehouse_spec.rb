require_relative '../../lib/warehouse'

RSpec.describe Warehouse do

  describe ".new" do
    let(:product1){
      Product.new("Pen", 1.2, 1)
    }

    let(:product2){
      Product.new("Notebook", 2, 1)
    }

    let(:product3){
      Product.new("Pencil", 1.5, 1)
    }

    let (:warehouse) {
      Warehouse.new()
    }

    it "returns instance of product class" do
      expect(warehouse).to be_a_kind_of(Warehouse)
    end

    it "returns instance of array" do
      expect(warehouse.make_list).to be_a_kind_of(Array)
    end

    it "contain 3 products" do
      expect(warehouse.make_list.size).to eql(3)
    end

    it "does not raise an error" do
    expect{
      Warehouse.new
    }.not_to raise_error
  end
  end
end
