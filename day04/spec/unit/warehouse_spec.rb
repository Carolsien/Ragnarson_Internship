require_relative '../../lib/warehouse'

RSpec.describe Warehouse do

  it "does not raise an error" do
    expect{
      Warehouse.new
    }.not_to raise_error
  end
end
