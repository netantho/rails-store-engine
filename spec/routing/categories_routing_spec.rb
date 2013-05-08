require "spec_helper"

describe CategoriesController do
  describe "Routing" do
    it_should_behave_like 'routing CRUD', 'categories'
  end
end
