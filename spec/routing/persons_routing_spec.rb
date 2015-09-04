require "rails_helper"

RSpec.describe PersonsController, type: :routing do
  describe "routing" do
    it "routes to #profile" do
      expect(:get => "/persons/profile").to route_to(
        "controller" => "persons", 
        "action" => "profile"
      )
    end                  
  end
end

