require "spec_helper"

describe GuessesController do
  describe "routing" do

    it "routes to #index" do
      get("/guesses").should route_to("guesses#index")
    end

    it "routes to #new" do
      get("/guesses/new").should route_to("guesses#new")
    end

    it "routes to #show" do
      get("/guesses/1").should route_to("guesses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/guesses/1/edit").should route_to("guesses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/guesses").should route_to("guesses#create")
    end

    it "routes to #update" do
      put("/guesses/1").should route_to("guesses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/guesses/1").should route_to("guesses#destroy", :id => "1")
    end

  end
end
