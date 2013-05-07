require "spec_helper"

describe Admin::CategoriesController do
  describe "Routing" do
    it_should_behave_like 'routing CRUD', 'admin/categories'
  end
end
