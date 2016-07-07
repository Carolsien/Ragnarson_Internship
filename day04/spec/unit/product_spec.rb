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
end
