require "spec_helper"

describe TimezonesController do
  describe "routing" do

    it "routes to #index" do
      get("/timezones").should route_to("timezones#index")
    end

    it "routes to #new" do
      get("/timezones/new").should route_to("timezones#new")
    end

    it "routes to #show" do
      get("/timezones/1").should route_to("timezones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/timezones/1/edit").should route_to("timezones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/timezones").should route_to("timezones#create")
    end

    it "routes to #update" do
      put("/timezones/1").should route_to("timezones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/timezones/1").should route_to("timezones#destroy", :id => "1")
    end

  end
end
