require "spec_helper"

describe UsersController do
  describe "Routing" do
    it_should_behave_like 'routing CRUD', 'users'
  end
end
