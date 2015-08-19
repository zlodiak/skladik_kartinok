require 'spec_helper'

describe ImagesController, type: :controller do
  describe 'index action' do
    it 'render index template for root page' do
      get :index
      response.should render_template('index')
      response.should render_template "layouts/application"
    end   


  end

 
  #describe 'show action' do
  #  it 'render overlay with details image' do
  #    image_detail = FactoryGirl.create(:image)
  #    @expected = { 
  #      url_giant: image_detail.image.url(:giant),
  #      description: image_detail.description,
  #      album_id: image_detail.album_id,
  #      url_original: image_detail.image.url,
  #      user_id: image_detail.user_id
  #    }.to_json
  #    
  #    get :show, { id: image_detail.id, image_id: image_detail.id }
  #    parsed_body = JSON.parse(response.body)
  #    parsed_body.should == @expected
  #  end
  #end 

=begin
  describe "index action" do
    it 'render title-element on root page' do
      #image_detail = FactoryGirl.create(:image)
      visit '/'
      #page.should have_content('div.thumb_album_container')
      #page.should have_selector('thumb_album_container')
      #page.should have_content('Последние загруженные изображения')
      #page.should have_selector 'head title', :visible => false
      expect(page).to have_selector('title',
                          :text => 'Складик картинок',
                          :visible => false)
    end  
  end 
=end
 
end

