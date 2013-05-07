require "spec_helper"

describe Admin::ProductsController do
  describe "Routing" do
    it_should_behave_like 'routing CRUD', 'admin/products'
  end
end
