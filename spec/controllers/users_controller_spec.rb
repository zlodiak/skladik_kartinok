require 'spec_helper'

describe AlbumsController, type: :controller do
  describe 'index action' do
    it 'check registration user' do
      visit new_user_registration_path
      expect(response.status).to eq(200)
    end    
  end 
end