require "spec_helper"

describe CartsController do
  it "understands and serves /cart" do
    { :get => "/cart" }.should route_to(:controller => "carts", :action => "index")
  end
end
