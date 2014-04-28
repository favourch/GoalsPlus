require "spec_helper"

describe StadiaController do
  describe "routing" do

    it "routes to #index" do
      get("/stadia").should route_to("stadia#index")
    end

    it "routes to #new" do
      get("/stadia/new").should route_to("stadia#new")
    end

    it "routes to #show" do
      get("/stadia/1").should route_to("stadia#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stadia/1/edit").should route_to("stadia#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stadia").should route_to("stadia#create")
    end

    it "routes to #update" do
      put("/stadia/1").should route_to("stadia#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stadia/1").should route_to("stadia#destroy", :id => "1")
    end

  end
end
