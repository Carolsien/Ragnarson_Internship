require "web_helper"

RSpec.describe "POST /basket", type: :request do

  context "invalid params" do
    let( :invalid_params ){
      { foo: 'bar' }
    }

    before do
      do_request( invalid_params )
    end

    it "returns 422 HTTP status code" do
      expect( last_response.status ).to eql( 422 )
    end
  end

  context "valid params" do
    let(:product) {
      FetchProduct.new.call
    }

    let( :valid_params ){
      {
        product_id: 1,
        quantity: 1
      }
    }

    before do
      do_request( valid_params )
    end

    it "returns 302 HTTP code" do
      expect( last_response.status ).to eql( 302 )
    end

    it "redirect to other site" do
      expect( last_response ).to be_redirect
    end

    it "returns 200 HTTP code when redirected" do
      follow_redirect!
      expect( last_response.status ).to eql( 200 )
    end

    it "returns to products" do
      follow_redirect!
      expect( last_request.url ).to eql( "http://example.org/products" )
    end
  end

  private
    def do_request(params={})
      post "/basket", params
    end

end
