shared_examples 'routing CRUD' do |url|
  it "understands and serves #index" do
    { :get => "/#{url}" }.should route_to(:controller => "#{url}", :action => "index")
  end

  it "understands and serves #show" do
    { :get => "/#{url}/1" }.should route_to(:controller => "#{url}", :action => "show", :id => "1")
  end

  it "understands and serves #edit" do
    { :get => "/#{url}/1/edit" }.should route_to(:controller => "#{url}", :action => "edit", :id => "1")
  end

  it "understands and serves #update" do
    { :put => "/#{url}/1" }.should route_to(:controller => "#{url}", :action => "update", :id => "1")
  end

  it "understands and serves #destroy" do
    { :delete => "/#{url}/1" }.should route_to(:controller => "#{url}", :action => "destroy", :id => "1")
  end
end