require "spec_helper"

describe Admin::DashboardController do
  it "understands and serves /admin/dashboard" do
    { get: "/admin/dashboard" }.should route_to(controller: "admin/dashboard", action: "index")
  end

  it "understands and serves /admin/dashboard/:id" do
    { get: "/admin/dashboard/1" }.should route_to(controller: "admin/dashboard", action: "show", id: '1')
  end

  it "understands and serves /admin/dashboard/:id/add/:sale_id" do
    { get: "/admin/dashboard/1/add/2" }.should route_to(controller: "admin/dashboard", action: "add", id: '1', sale_id: '2')
  end

  it "understands and serves /admin/dashboard/:id/del/:sale_id" do
    { get: "/admin/dashboard/1/del/2" }.should route_to(controller: "admin/dashboard", action: "del", id: '1', sale_id: '2')
  end

  it "understands and serves /admin/dashboard/:id/cancel" do
    { get: "/admin/dashboard/1/cancel" }.should route_to(controller: "admin/dashboard", action: "cancel", id: '1')
  end

  it "understands and serves /admin/dashboard/:id/return" do
    { get: "/admin/dashboard/1/return" }.should route_to(controller: "admin/dashboard", action: "return", id: '1')
  end

  it "understands and serves /admin/dashboard/:id/ship" do
    { get: "/admin/dashboard/1/ship" }.should route_to(controller: "admin/dashboard", action: "ship", id: '1')
  end
end
