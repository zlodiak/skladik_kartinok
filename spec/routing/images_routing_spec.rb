require "rails_helper"

RSpec.describe ImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/images").to route_to(
        "controller" => "images", 
        "action" => "index"
      )
    end

    it "routes to #new" do
      expect(:get => "/images/new").to route_to(
        "controller" => "images", 
        "action" => "new"
      )
    end

    it "routes to #show" do
      expect(:get => "/images/1").to route_to(
        "controller" => "images", 
        "action" => "show", 
        "id" => "1"
      )
    end

    it "routes to #edit" do
      expect(:get => "/images/1/edit").not_to route_to(
        "controller" => "images", 
        "action" => "edit", 
        "id" => "1"
      )
    end

    it "routes to #create" do
      expect(:post => "/images").to route_to(
        "controller" => "images", 
        "action" => "create"
      )
    end

    it "routes to #update via PUT" do
      expect(:put => "/images/1").to route_to(
        "controller" => "images", 
        "action" => "update", 
        "id" => "1"
        )
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/images/1").to route_to(
        "controller" => "images", 
        "action" => "update", 
        "id" => "1"
      )
    end    

    it "routes to #destroy" do
      expect(:delete => "/images/1").to route_to(
        "controller" => "images", 
        "action" => "destroy", 
        "id" => "1"
      )
    end 

    it "routes to #image_poll_associated" do
      expect(:post => "/image_poll_associated").to route_to(
        "controller" => "images", 
        "action" => "image_poll_associated"
      )
    end  

    it "routes to #create_direct" do
      expect(:post => "/images/create_direct").to route_to(
        "controller" => "images", 
        "action" => "create_direct"
      )
    end  

    it "routes to #get_image_data" do
      expect(:get => "/get_image_data/1").to route_to(
        "controller" => "images", 
        "action" => "get_image_data", 
        "id" => "1"
      )
    end             
  end
end

