require 'rails_helper'
require 'helpers/application_helper_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe PollsController, type: :controller do
  describe "GET #index" do
    before :all do
      @user = FactoryGirl.create(:user)
    end 

    it "assign user as @user" do      
      get :index, user_id: @user.id
      expect(assigns(:user)).to eq(@user)
    end     

    it "assigns polls as @polls" do      
      get :index, user_id: @user.id
      expect(assigns(:polls)).to eq(@user.polls)
    end       

    it "redirects to the index view" do
      get :index, user_id: @user.id
      expect(response).to render_template("index")
    end       
  end

  describe "GET #show" do
    before :all do
      @user = FactoryGirl.create(:user)
      @poll = FactoryGirl.create(:poll, user_id: @user.id)      
    end

    it "assigns the requested user as @user" do
      get :show, user_id: @user.id, id: @poll.id
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns the requested images as @images" do
      get :show, user_id: @user.id, id: @poll.id
      expect(assigns(:images)).to eq(@poll.images)
    end   

    it "redirects to the show view" do
      get :show, user_id: @user.id, id: @poll.id
      expect(response).to render_template("show")
    end               
  end

  describe "GET #new" do
    before :all do
      @user = FactoryGirl.create(:user) 
    end

    it "assigns a new poll as @poll" do
      get :new, user_id: @user.id
      expect(assigns(:poll)).to be_a_new(Poll)
    end

    it "assigns the requested user as @user" do
      get :new, user_id: @user.id
      expect(assigns(:user)).to eq(@user)
    end  

    it "redirects to the new view" do
      get :new, user_id: @user.id
      expect(response).to render_template("new")
    end       
  end

  describe "DELETE #destroy" do
    it "destroys the polls for a specific user " do
      login_user

      expect {
        @poll = FactoryGirl.create(:poll, user_id: @user.id)  
        delete :destroy, { user_id: @user.id, id: @poll.id }
      }.to change(Poll, :count).by(1)
    end
  end
end
