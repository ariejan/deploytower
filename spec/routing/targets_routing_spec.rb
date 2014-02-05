require 'spec_helper'

describe TargetsController do
  describe "routing" do

    it "#index" do
      expect(get("/targets")).to route_to("targets#index")
    end

    it "#show" do
      expect(get("/targets/1")).to route_to("targets#show", id: "1")
    end

    it "#new" do
      expect(get("/targets/new")).to route_to("targets#new")
    end

    it "#edit" do
      expect(get("/targets/1/edit")).to route_to("targets#edit", id: "1")
    end

    it "#create" do
      expect(post("/targets")).to route_to("targets#create")
    end

    it "#update" do
      expect(put("/targets/1")).to route_to("targets#update", id: "1")
    end

    it "#destroy" do
      expect(delete("/targets/1")).to route_to("targets#destroy", id: "1")
    end
  end
end
