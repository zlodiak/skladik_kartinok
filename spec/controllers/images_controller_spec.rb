require 'spec_helper'

describe ImagesController, type: :controller do
  describe 'index action' do
    it 'render index template for root page' do
      get :index
      response.should render_template('index')
      response.should render_template "layouts/application"
    end   
  end

  #describe 'index action' do
    #it 'check title on page and status 200' do
      #@image = FactoryGirl.create(:image)  
      #@images = []
      #@images.push @image
      #visit root_path(images: @images)
      #binding.pry
      #expect(response.status).to eq(200)
      #expect(page).to have_title "Складник картинок"    
      #expect(response).to render_template(:index)
      #page.should have_selector("#thumbsList")
      #page.should have_selector("h1", :text => "Последние загруженные изображения")
    #end    
  #end  
end

