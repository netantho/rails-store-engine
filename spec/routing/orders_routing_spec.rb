require "spec_helper"

describe CartsController do
  it "understands and serves /orders" do
    { get: "/orders" }.should route_to(controller: "orders", action: "index")
  end

  it "understands and serves /orders/:id" do
    { get: "/orders/1" }.should route_to(controller: "orders", action: "show", id: '1')
  end
end