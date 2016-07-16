require "web_helper"

RSpec.describe "GET /products", type: :request do
  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect( last_response.status ).to eql( 200 )
  end

  it "returns valid html Content-Type" do
    expect( last_response.headers["Content-Type"] ).to include( "text/html" )
  end

  it "returns h1 element with 'List of products'" do
    expect( last_response.body ).to include( "<h1> List of products </h1>" )
  end

  it "returns a link to product with id=1" do
    expect( last_response.body ).to include( "<a href=\"/products/1\">" )
  end

  private
    def do_request
      get "/products"
    end
end
