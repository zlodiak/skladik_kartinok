module Helpers
  def login_user
    @user = FactoryGirl.create(:user) 
    visit new_user_session_path

    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => "qwerty"
    click_button "commitSignIn" #OK sign in
  end
end