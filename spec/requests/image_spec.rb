require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "return 200 status code for GET /images" do
    before :all do   
      @user = FactoryGirl.create(:user)
    end

    it "#index" do      
      get images_path
      expect(response).to have_http_status(200)
    end              
  end
end

