require "rails_helper"

RSpec.describe ImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/images").to route_to(
        "controller" => "admin/images", 
        "action" => "index"
      )
    end

    it "routes to #new" do
      expect(:get => "/admin/images/new").to route_to(
        "controller" => "admin/images", 
        "action" => "new"
      )
    end

    it "routes to #show" do
      expect(:get => "/admin/images/1").to route_to(
        "controller" => "admin/images", 
        "action" => "show", 
        "id" => "1"
      )
    end

    it "routes to #edit" do
      expect(:get => "/admin/images/1/edit").to route_to(
        "controller" => "admin/images", 
        "action" => "edit", 
        "id" => "1"
      )
    end

    it "routes to #create" do
      expect(:post => "/admin/images").to route_to(
        "controller" => "admin/images", 
        "action" => "create"
      )
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/images/1").to route_to(
        "controller" => "admin/images", 
        "action" => "update", 
        "id" => "1"
        )
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/images/1").to route_to(
        "controller" => "admin/images", 
        "action" => "update", 
        "id" => "1"
      )
    end    

    it "routes to #destroy" do
      expect(:delete => "/admin/images/1").to route_to(
        "controller" => "admin/images", 
        "action" => "destroy", 
        "id" => "1"
      )
    end 

    it "routes to #index via empty string" do
      expect(:get => "/admin").to route_to(
        "controller" => "admin/images", 
        "action" => "index"
      )
    end     
  end
end

