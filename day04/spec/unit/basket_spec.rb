require_relative '../../lib/basket'

RSpec.describe Basket do

  it "describe an Array" do
    expect(Basket.create_basket).to be_a_kind_of(Array)
  end


  it "does not raise an error" do
    expect{
      Basket.new
    }.not_to raise_error
  end
end
