require 'spec_helper'
require 'helpers/application_helper_spec'

RSpec.configure do |c|
  c.include Helpers
end

describe UsersController, type: :controller do
  describe 'users #index' do
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
  end 

  describe 'registration' do
    before(:each) do
      4.times do |n|
        FactoryGirl.create(:user)  
      end
      @user = FactoryGirl.create(:user)  
    end

    it 'check response status code for registration page' do
      visit new_user_registration_path      
      expect(response.status).to eq(200)      
      expect(page).to have_selector("h2", :text => "Регистрация")     
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
      fill_in "user_name", :with => "us1235235"
      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "qwerty"
      fill_in "user_password_confirmation", :with => "qwerty"
      click_button "commitRegistration"      
      expect(page).to have_selector('.email_cell .field_with_errors')         
    end              
  end  

  describe 'login' do
    before(:each) do
      4.times do |n|
        FactoryGirl.create(:user)  
      end
      @user = FactoryGirl.create(:user)  
    end

    it 'response status code for login page' do
      visit new_user_session_path      
      expect(response.status).to eq(200)      
      expect(page).to have_selector("h2", :text => "Вход")     
    end

    it 'failed login user via wrong password' do
      visit new_user_session_path
      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "qwertyzzz"
      click_button "commitSignIn"      
      expect(page).to have_selector('.alert-alert')         
    end  

    it 'failed login user via wrong email' do
      visit new_user_session_path 
      fill_in "user_email", :with => 'sdafsdfsdf@ds.sd'
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"      
      expect(page).to have_selector('.alert-alert')         
    end        

    it 'successful login user' do
      login_user  
      visit '/' 
      expect(page).to have_selector('#exit')         
    end   

    it 'display username on top panel' do
      @user = FactoryGirl.create(:user) 
      visit new_user_session_path
      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"  
      visit '/'
      expect(page).to have_selector('.logo_area .name')         
    end
  end     
end
