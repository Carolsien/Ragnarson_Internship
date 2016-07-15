require "web_helper"

RSpec.describe "GET /basket", type: :request do

  context "show empty basket" do

    before do
      do_request
    end

    it "returns 200 HTTP code" do
      expect( last_response.status ).to eql(200)
    end

    it "returns valid html Content-Type" do
      expect( last_response.headers["Content-Type"] ).to include( "text/html" )
    end

    it "returns element with 'Name'" do
      expect( last_response.body ).to include( "<th>Name</th>" )
    end

    it "returns element with 'Price'" do
      expect( last_response.body ).to include( "<th>Price</th>" )
    end

    it "returns element with 'Quantity'" do
      expect( last_response.body ).to include( "<th>Quantity</th>" )
    end

    it "returns element with 'Total'" do
      expect( last_response.body ).to include( "<th>Total</th>" )
    end

    it "returns element with 'Summary'" do
      expect( last_response.body ).to include( "<td>Summary</td>" )
    end

  end

  context "show basket with product" do

    let!(:added_product){
      AddToBasket.new( {
        "product_id" => product.id,
        "quantity" => 1
        } ).call
    }

    let!(:product){
      FetchProducts.new.call.first
    }


    before do
      do_request
    end

    it "returns 200 HTTP code" do
      expect( last_response.status ).to eql(200)
    end

    it "returns valid html Content-Type" do
      expect( last_response.headers["Content-Type"] ).to include( "text/html" )
    end

    it "returns element with 'Name'" do
      expect( last_response.body ).to include( "<th>Name</th>" )
    end

    it "returns element with 'Price'" do
      expect( last_response.body ).to include( "<th>Price</th>" )
    end

    it "returns element with 'Quantity'" do
      expect( last_response.body ).to include( "<th>Quantity</th>" )
    end

    it "returns element with 'Total'" do
      expect( last_response.body ).to include( "<th>Total</th>" )
    end

    it "returns element with 'Summary'" do
      expect( last_response.body ).to include( "<td>Summary</td>" )
    end

    it "contains product name" do
      expect( last_response.body ).to include("#{product.name}")
    end

    it "contains a button with name Delete form basket" do
      expect( last_response.body ).to include( "<input type=\"submit\" value=\"Delete from basket\">" )
    end

  end

  private
    def do_request
      get "/basket"
    end

end
