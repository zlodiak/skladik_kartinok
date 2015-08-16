require 'spec_helper'

describe ImagesController, type: :controller do
  describe 'index action' do
    it 'render index template for root page' do
      get :index
      response.should render_template('index')
      response.should render_template "layouts/application"
    end
  end
 
  describe 'show action' do
    it 'render overlay with details image' do
      image_detail = FactoryGirl.create(:image)
      @expected = { 
        url_giant: image_detail.image.url(:giant),
        description: image_detail.description,
        album_id: image_detail.album_id,
        url_original: image_detail.image.url,
        user_id: image_detail.user_id
      }.to_json

      get :show, { id: image_detail.id, image_id: image_detail.id }
      parsed_body = JSON.parse(response.body)
      parsed_body.should == @expected
    end
  end 
end