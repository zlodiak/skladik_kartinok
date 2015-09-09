module Helpers
  def login_user
    @user = FactoryGirl.create(:user, :regular) 
    visit new_user_session_path

    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => "qwerty"
    click_button "commitSignIn" #OK sign in
  end

  def login_manager
    @user = FactoryGirl.create(:user, :manager) 
    visit new_user_session_path

    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => "qwerty"
    click_button "commitSignIn" #OK sign in
  end

  def login_admin
    @user = FactoryGirl.create(:user, :admin) 
    visit new_user_session_path

    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => "qwerty"
    click_button "commitSignIn" #OK sign in
  end    
end