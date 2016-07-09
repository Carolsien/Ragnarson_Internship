require_relative '../../lib/basket'

RSpec.describe Basket do

  it "returns instance of basket" do
    expect(Basket.new).to be_a_kind_of(Basket)
  end


  it "does not raise an error" do
    expect{
      Basket.new
    }.not_to raise_error
  end
end
