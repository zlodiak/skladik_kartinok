require 'rails_helper'

RSpec.describe "Polls", type: :request do
  describe "return 200 status code for GET /polls" do
    before :all do   
      @user = FactoryGirl.create(:user)
    end

    it "#index" do      
      get user_polls_path(@user)
      expect(response).to have_http_status(200)
    end

    it "#show" do
      @poll = FactoryGirl.create(:poll, user_id: @user.id)  
      get user_poll_path(@user, @poll)
      expect(response).to have_http_status(200)
    end   

    it "#edit" do
      get new_user_poll_path(@user)
      expect(response).to have_http_status(200)
    end        
  end
end

