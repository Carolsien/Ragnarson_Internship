require "web_helper"

RSpec.describe "GET /products/:id", type: :request do
  context "without existing product" do

    before do
      do_request( 50 )
    end

    it "returns 404 HTTP code" do
      expect( last_response.status ).to eql( 404 )
    end

    it "returns valid html Content-Type" do
      expect( last_response.headers["Content-Type"] ).to include( "text/html" )
    end

  end

  context "with existing product" do
    let(:product){
      FetchProducts.new.call.first
    }

    before do
      do_request( product.id )
    end

    it "returns 200 HTTP code" do
      expect( last_response.status ).to eql( 200 )
    end

    it "returns valid html Content-Type" do
      expect( last_response.headers["Content-Type"] ).to include( "text/html" )
    end

    it "returns a h1 with product name" do
      expect( last_response.body ).to include( "#{product.name}" )
    end

    it "contains a input field with number" do
      expect( last_response.body ).to include( "<input type=\"number\" name=\"quantity\" value=1>" )
    end

    it "contains a button with name Add to Basket" do
      expect( last_response.body ).to include( "<input type=\"submit\" value=\"Add to Basket\">" )
    end
  end

  private
  def do_request( id )
    get "/products/#{id}"
  end
end
