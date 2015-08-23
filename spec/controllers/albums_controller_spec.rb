require 'spec_helper'

describe AlbumsController, type: :controller do


  #describe 'show action' do
  #  it 'should render page ok' do
  #    @album = FactoryGirl.create(:album)
  #    visit user_album_path(user_id: 1, id: @album.id) 
  #    response.should render_template('show')
  #    response.should render_template("layouts/application")
  #  end
  #end  

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
      response.should render_template('show')
      response.should render_template("layouts/application")
    end
      
    it 'should render profile page for signin user' do
      visit user_path @user.id
      page.should have_selector("#userProfile", :text => "Ваш профиль")
    end 

    it 'should not render profile page for signin user' do
      visit user_path @user.id
      click_link('Выйти')
      page.should_not have_selector("#userProfile", :text => "Ваш профиль")
    end     

    it 'should logout after click on logout-button for signin user' do
      visit '/'
      click_link('Выйти')
      expect(page).to have_selector(".alert", :text => 'Вы вышли из системы') 
    end       
  end  
end