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
=begin
  describe "POST #create" do
    context "with valid params" do
      before(:all) do
    
      end

      it "creates a new Poll" do  
      login_user

      expect {
        post :create, user_id: @user.id
        @poll = FactoryGirl.create(:poll, user_id: 1)          
      }.to change(Poll, :count).by(1)
      end
    end
  end


      it "assigns a newly created poll as @poll" do
        post :create, {:poll => valid_attributes}, valid_session
        expect(assigns(:poll)).to be_a(Poll)
        expect(assigns(:poll)).to be_persisted
      end

      it "redirects to the created poll" do
        post :create, {:poll => valid_attributes}, valid_session
        expect(response).to redirect_to(Poll.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved poll as @poll" do
        post :create, {:poll => invalid_attributes}, valid_session
        expect(assigns(:poll)).to be_a_new(Poll)
      end

      it "re-renders the 'new' template" do
        post :create, {:poll => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
      =end

    end
  end
=begin
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested poll" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => new_attributes}, valid_session
        poll.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested poll as @poll" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => valid_attributes}, valid_session
        expect(assigns(:poll)).to eq(poll)
      end

      it "redirects to the poll" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => valid_attributes}, valid_session
        expect(response).to redirect_to(poll)
      end
    end

    context "with invalid params" do
      it "assigns the poll as @poll" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => invalid_attributes}, valid_session
        expect(assigns(:poll)).to eq(poll)
      end

      it "re-renders the 'edit' template" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end
=end
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
