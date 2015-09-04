require "rails_helper"

RSpec.describe AlbumsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/1/albums").to route_to(
        "controller" => "albums", 
        "action" => "index", 
        "user_id" => "1"
      )
    end


    it "routes to #new" do
      expect(:get => "/users/1/albums/new").to route_to(
        "controller" => "albums", 
        "action" => "new", 
        "user_id" => "1"
      )
    end

    it "routes to #show" do
      expect(:get => "/users/1/albums/1").to route_to(
        "controller" => "albums", 
        "action" => "show", 
        "user_id" => "1",
        "id" => "1"
      )
    end

    it "routes to #edit" do
      expect(:get => "/users/1/albums/1/edit").to route_to(
        "controller" => "albums", 
        "action" => "edit", 
        "user_id" => "1",
        "id" => "1"
      )
    end

    it "routes to #create" do
      expect(:post => "/users/1/albums").to route_to(
        "controller" => "albums", 
        "action" => "create", 
        "user_id" => "1",
      )
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/albums/1").to route_to(
        "controller" => "albums", 
        "action" => "update", 
        "user_id" => "1",
        "id" => "1"
        )
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/albums/1").to route_to(
        "controller" => "albums", 
        "action" => "update", 
        "user_id" => "1",
        "id" => "1"
      )
    end    

    it "routes to #destroy" do
      expect(:delete => "/users/1/albums/1").to route_to(
        "controller" => "albums", 
        "action" => "destroy", 
        "user_id" => "1",
        "id" => "1"
      )
    end

    it "routes to #get_album_data" do
      expect(:get => "/users/1/get_album_data/1").to route_to(
        "controller" => "albums", 
        "action" => "get_album_data", 
        "user_id" => "1",
        "id" => "1"
      )
    end    
  end
end

