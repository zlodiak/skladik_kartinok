require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "return 200 status code for GET /users" do
    before :all do   
      @user = FactoryGirl.create(:user, :user_status)
    end

    it "#show" do
      get user_path(@user)
      expect(response).to have_http_status(200)
    end                 
  end
end

