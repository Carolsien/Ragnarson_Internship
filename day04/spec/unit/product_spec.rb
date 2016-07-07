require_relative '../../lib/product.rb'

RSpec.describe Product do

  it "has 3 params" do
    expect{
      Product.new(nil, nil, nil)
    }.not_to raise_error
  end

  it "has 0 params" do
    expect{
      Product.new()
    }.to raise_error(ArgumentError)
  end

  context "#name" do

    it "returns proper value when name foo given" do
      expect(Product.new("fooo", nil, nil).name).to eql("fooo")
    end

    it "raise error when name is empty" do
      expect{
        Product.new("", nil, nil).name
      }.to raise_error(ArgumentError)
    end

    it "raise error when name has only 2 characters" do
      expect{
        Product.new("ss", nil, nil).name
      }.to raise_error(ArgumentError)
    end

    it "raise error when nil given" do
      expect{
        Product.new(nil, nil, nil).name
      }.to raise_error(ArgumentError)
    end

    it "raise error when number given" do
      expect{
        Product.new(9, nil, nil).name
      }.to raise_error(ArgumentError)
    end

    it "does not raise error when string given" do
      expect{
        Product.new("foo", nil, nil).name
      }.not_to raise_error
    end

    it "does not raise error when name has 4 characters" do
      expect{
        Product.new("ssss", nil, nil).name
      }.not_to raise_error
    end
  end


  context "#price" do

    it "returns 12 when 12 given" do
      expect(Product.new(nil, 12, nil).price).to eq(12)
    end

    it "raise error when string given" do
      expect{
        Product.new(nil, "aaa", nil).price
      }.to raise_error(ArgumentError)
    end

    it "raise error when number with comma given" do
      expect{
        Product.new(nil, 12,2 , nil).price
      }.to raise_error(ArgumentError)
    end

    it "raise error when number 0 given" do
      expect{
        Product.new(nil, 0 , nil).price
      }.to raise_error(ArgumentError)
    end

    it "raise error when number 10001 given" do
      expect{
        Product.new(nil, 10001 , nil).price
      }.to raise_error(ArgumentError)
    end

    it "raise error when number -2 given" do
      expect{
        Product.new(nil, -2 , nil).price
      }.to raise_error(ArgumentError)
    end

    it "does not raise error when number with . given" do
      expect{
        Product.new(nil, 12.3 , nil).price
      }.not_to raise_error
    end

    it "does not raise error when number given" do
      expect{
        Product.new(nil, 12, nil).price
      }.not_to raise_error
    end


  end
end
