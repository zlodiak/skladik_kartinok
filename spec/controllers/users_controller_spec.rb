require 'spec_helper'



describe PersonsController, type: :controller do
  before(:each) do
    4.times do |n|
      FactoryGirl.create(:user)  
    end
    @user = FactoryGirl.create(:user)  
  end

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

      fill_in "user_name", :with => "us1235235"
      fill_in "user_email", :with => @user.email
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

      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "qwertyzzz"
      click_button "commitSignIn"      

      expect(page).to have_selector('.alert-alert')         
    end  

    it 'check failed login user via wrong email' do
      visit new_user_session_path 

      fill_in "user_email", :with => 'sdafsdfsdf@ds.sd'
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"      

      expect(page).to have_selector('.alert-alert')         
    end        

    it 'check successful login user' do
      visit new_user_session_path

      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "qwerty"
      click_button "commitSignIn"      

      expect(page).to have_selector('.alert-notice')         
    end   

  end    

  describe 'user albums' do
    it 'check albums page capybara for not authenticated user' do
      user = FactoryGirl.create(:user)  
      visit user_albums_path(user.id)  

      expect(response.status).to eq(200)      
      expect(response).to render_template(:index)
      expect(page).to have_selector(".albums_list_label")     
    end                                                      
  end                                                      

  describe 'users:index action' do
    it 'check response status code for index page' do
      visit users_path

      expect(response).to be_success
      response.should render_template('index')
      response.should render_template "layouts/application"
      expect(page).to have_selector("span", :text => 'Список пользователей')  
    end 

    it 'should pagination presence if users more than 10' do
      visit users_path
      expect(page).to have_selector(".pagination")  
    end 

    it 'should click on username lead to userprofile page ' do      
      visit users_path
      click_link(@user.name)
      expect(page).to have_selector("#userProfile") 
    end 

    it 'should not display list after change name optin in filter to noexisting' do      
      visit users_path
      fill_in('fld_name', :with => 'werwwterterteter')  
      click_button('Фильтровать')
      expect(page).to have_selector("#noAlbums") 
    end 

    it 'should display list after change name optin in filter to existing' do      
      visit users_path
      fill_in('fld_name', :with => 'us1')  
      click_button('Фильтровать')
      expect(page).to have_selector(".name_link") 
    end    
  end 


end
