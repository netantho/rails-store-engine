require "spec_helper"

describe ProductsController do
  describe "Routing" do
    it_should_behave_like 'routing CRUD', 'products'
  end
end
