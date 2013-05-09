require "spec_helper"

describe CartsController do
  it "understands and serves /cart" do
    { get: "/cart" }.should route_to(controller: "carts", action: "index")
  end

  it "understands and serves /cart/:product_id/add" do
    { get: "/cart/1/add" }.should route_to(controller: "carts", action: "add", product_id: '1')
  end
  
  it "understands and serves /cart/:product_id/del" do
    { get: "/cart/1/del" }.should route_to(controller: "carts", action: "del", product_id: '1')
  end
    
  it "understands and serves /cart/empty" do
    { get: "/cart/empty" }.should route_to(controller: "carts", action: "empty")
  end
  
  it "understands and serves /cart/checkout" do
    { get: "/cart/checkout" }.should route_to(controller: "carts", action: "checkout")
  end
end
