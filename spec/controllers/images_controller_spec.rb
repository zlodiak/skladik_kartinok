require 'spec_helper'

describe ImagesController, type: :controller do
  describe 'index action' do
    it 'render index template for root page' do
      get :index
      response.should render_template('index')
      response.should render_template "layouts/application"
    end   
  end
end

