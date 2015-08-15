require 'spec_helper'

describe AlbumsController, type: :controller do
  describe 'index action' do
    it 'render index template if user is found' do
      user = FactoryGirl.create(:user)
      get :index, { user_id: user.id }
      response.should render_template('index')
      response.should render_template "layouts/application"
    end
  end

  describe 'show action' do
    it 'render show template if user and album is found' do
      album = FactoryGirl.create(:album)
      get :show, { user_id: 1, id: album.id }
      response.should render_template('show')
      response.should render_template "layouts/application"
    end
  end  
end