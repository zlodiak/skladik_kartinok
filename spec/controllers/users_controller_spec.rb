require 'spec_helper'

describe PersonsController, type: :controller do
  describe 'registration' do
    it 'check response status code for registration page' do
      visit new_user_registration_path      
      expect(response.status).to eq(200)      
      expect(page).to have_selector("h2", :text => "Регистрация")     
    end 

    it 'check successful registration user' do
      visit new_user_registration_path

      fill_in "user_name", :with => "admin"
      fill_in "user_email", :with => "ad@ad.ad"
      fill_in "user_password", :with => "qwerty"
      fill_in "user_password_confirmation", :with => "qwerty"
      click_button "commitRegistration"      

      expect(page).to have_selector('.alert', :text => "Добро пожаловать. Вы зарегистрировались")         
    end   

    it 'check failed registration user via failed password confirmation' do
      visit new_user_registration_path

      fill_in "user_name", :with => "admin"
      fill_in "user_email", :with => "ad@ad.ad"
      fill_in "user_password", :with => "qwerty"
      fill_in "user_password_confirmation", :with => "qwertyzzz"
      click_button "commitRegistration"      

      expect(page).to have_selector('.password_conformation_cell .field_with_errors')         
    end  

    it 'check failed registration user via exist email' do
      visit new_user_registration_path
      user = FactoryGirl.create(:user)  

      fill_in "user_name", :with => "us1235235"
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => "qwerty"
      fill_in "user_password_confirmation", :with => "qwerty"
      click_button "commitRegistration"      

      expect(page).to have_selector('.email_cell .field_with_errors')         
    end         
  end  

  describe 'login' do
    it 'check response status code for login page' do
      visit new_user_session_path      
      expect(response.status).to eq(200)      
      expect(page).to have_selector("h2", :text => "Вход")     
    end

    it 'check failed login user via wrong password' do
      visit new_user_session_path
      user = FactoryGirl.create(:user)  

      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => "qwertyzzz"
      click_button "commitSignIn"      

      expect(page).to have_selector('.alert-alert')         
    end  

    it 'check failed login user via wrong email' do
      visit new_user_session_path
      user = FactoryGirl.create(:user)  

      fill_in "user_email", :with => 'sdafsdfsdf@ds.sd'
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"      

      expect(page).to have_selector('.alert-alert')         
    end        

    it 'check successful login user' do
      visit new_user_session_path
      user = FactoryGirl.create(:user)  

      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"      

      expect(page).to have_selector('.alert-notice')         
    end  
  end                                                        
end