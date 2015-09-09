require 'spec_helper'

describe AlbumsController, type: :controller do
  describe 'signin user looks' do
    before(:each) do
      @user = FactoryGirl.create(:user) 
      visit new_user_session_path

      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"    
    end

    it 'should render page ok' do
      visit user_path @user.id
      expect(response).to render_template("show")
      expect(response).to render_template("layouts/application")
    end
      
    it 'should render profile page for signin user' do
      visit user_path @user.id
      expect(page).to have_selector('#userProfile', :text => "Ваш профиль")  
    end 

    it 'should not render profile page for signin user' do
      visit user_path @user.id
      click_link('Выйти')
      expect(page).not_to have_selector('#userProfile', :text => "Ваш профиль")  
    end     

    it 'should logout after click on logout-button for signin user' do
      visit '/'
      click_link('Выйти')
      expect(page).to have_selector(".alert", :text => 'Вы вышли из системы') 
    end       
  end  
end