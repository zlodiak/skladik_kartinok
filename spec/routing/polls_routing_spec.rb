require "rails_helper"

RSpec.describe PollsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/1/polls").to route_to(
        "controller" => "polls", 
        "action" => "index", 
        "user_id" => "1"
      )
    end

    it "routes to #new" do
      expect(:get => "/users/1/polls/new").to route_to(
        "controller" => "polls", 
        "action" => "new", 
        "user_id" => "1"
      )
    end

    it "routes to #show" do
      expect(:get => "/users/1/polls/1").to route_to(
        "controller" => "polls", 
        "action" => "show", 
        "user_id" => "1",
        "id" => "1"
      )
    end

    it "routes to #edit" do
      expect(:get => "/users/1/polls/1/edit").to route_to(
        "controller" => "polls", 
        "action" => "edit", 
        "user_id" => "1",
        "id" => "1"
      )
    end

    it "routes to #create" do
      expect(:post => "/users/1/polls").to route_to(
        "controller" => "polls", 
        "action" => "create", 
        "user_id" => "1",
      )
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/polls/1").to route_to(
        "controller" => "polls", 
        "action" => "update", 
        "user_id" => "1",
        "id" => "1"
        )
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/polls/1").to route_to(
        "controller" => "polls", 
        "action" => "update", 
        "user_id" => "1",
        "id" => "1"
      )
    end    

    it "routes to #destroy" do
      expect(:delete => "/users/1/polls/1").to route_to(
        "controller" => "polls", 
        "action" => "destroy", 
        "user_id" => "1",
        "id" => "1"
      )
    end
  end
end

