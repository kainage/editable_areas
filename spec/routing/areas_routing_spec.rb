require "spec_helper"

describe EditableAreasController do
  describe "routing" do
    it "routes to #update with put" do
      put("/editable_areas/1").should route_to("editable_areas#update", :id => "1")
    end
  end
end