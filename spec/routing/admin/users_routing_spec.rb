require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/users").to route_to(
        "controller" => "admin/users", 
        "action" => "index"
      )
    end

    it "routes to #new" do
      expect(:get => "/admin/users/new").to route_to(
        "controller" => "admin/users", 
        "action" => "new"
      )
    end

    it "routes to #show" do
      expect(:get => "/admin/users/1").to route_to(
        "controller" => "admin/users", 
        "action" => "show", 
        "id" => "1"
      )
    end

    it "routes to #edit" do
      expect(:get => "/admin/users/1/edit").to route_to(
        "controller" => "admin/users", 
        "action" => "edit", 
        "id" => "1"
      )
    end

    it "routes to #create" do
      expect(:post => "/admin/users").to route_to(
        "controller" => "admin/users", 
        "action" => "create"
      )
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/users/1").to route_to(
        "controller" => "admin/users", 
        "action" => "update", 
        "id" => "1"
        )
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/users/1").to route_to(
        "controller" => "admin/users", 
        "action" => "update", 
        "id" => "1"
      )
    end    

    it "routes to #destroy" do
      expect(:delete => "/admin/users/1").to route_to(
        "controller" => "admin/users", 
        "action" => "destroy", 
        "id" => "1"
      )
    end     
  end
end

