require 'spec_helper'

describe ImagesController, type: :controller do
  describe 'GET #index' do
    it 'response is success' do
      get :index
      expect(response).to be_success
    end  

    it 'response code is 200' do
      get :index
      expect(response).to have_http_status(200)
    end     

    it "renders the index template" do    
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the images into @images" do
      image1, image2 = FactoryGirl.create(:image), FactoryGirl.create(:image)
      get :index
      expect(assigns(:images)).to match_array([image1, image2])
    end                  
  end 

  describe "GET #show" do
    before(:each) do
      image = FactoryGirl.create(:image)      
      get :show, id: image.id, image_id: image.id
    end    

    it 'response is success' do
      expect(response).to be_success
    end  

    it 'response code is 200' do
      expect(response).to have_http_status(200)
    end     

    it "responds with json" do    
      expect(response.content_type).to eq "application/json"
    end
  end
end

