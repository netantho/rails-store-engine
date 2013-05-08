require "spec_helper"

describe Admin::ProductsController do
  describe "Routing" do
    it_should_behave_like 'routing CRUD', 'admin/products'
  end
  
  it "understands and serves #visible" do
    { get: "/admin/products/1/visible" }.should route_to(controller: "admin/products", action: "visible", product_id: "1")
  end
  
  it "understands and serves #unvisible" do
    { get: "/admin/products/1/unvisible" }.should route_to(controller: "admin/products", action: "unvisible", product_id: "1")
  end
end
