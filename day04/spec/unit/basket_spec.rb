require_relative '../../lib/basket'

RSpec.describe Basket do

  it "does not raise an error" do
    expect{
      Basket.new
    }.not_to raise_error
  end
end
