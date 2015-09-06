require 'rails_helper'

RSpec.describe "Albums", type: :request do
  describe "return 200 status code for GET /albums" do
    before :all do   
      @user = FactoryGirl.create(:user)
    end

    it "#index" do      
      get user_albums_path(@user)
      expect(response).to have_http_status(200)
    end

    it "#show" do
      @album = FactoryGirl.create(:album, user_id: @user.id)  
      get user_album_path(@user, @album)
      expect(response).to have_http_status(200)
    end   

    it "#new" do
      get new_user_album_path(@user)
      expect(response).to have_http_status(200)
    end                
  end
end

