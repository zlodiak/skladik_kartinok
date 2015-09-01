require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  describe "GET #index" do
    before :all do
      @user = FactoryGirl.create(:user)
    end 

    it "assign user as @user" do      
      get :index, user_id: @user
      expect(assigns(:user)).to eq(@user)
    end     

    it "assigns polls as @polls" do      
      get :index, user_id: @user  
      expect(assigns(:polls)).to eq(@user.polls)
    end       

    it "redirects to the index view" do
      get :index, user_id: @user
      expect(response).to render_template("index")
    end       
  end

=begin
  describe "GET #show" do
    before :each do
      @poll = FactoryGirl.create(:poll)
      @user = User.find(@poll.id)
    end

    it "assigns the requested poll as @poll" do
      get :show, user_id: @poll.user_id, id:@poll.id
      expect(assigns(:polls)).to eq([@poll])
    end
  end

  describe "GET #new" do
    it "assigns a new poll as @poll" do
      get :new, {}, valid_session
      expect(assigns(:poll)).to be_a_new(Poll)
    end
  end

  describe "GET #edit" do
    it "assigns the requested poll as @poll" do
      poll = Poll.create! valid_attributes
      get :edit, {:id => poll.to_param}, valid_session
      expect(assigns(:poll)).to eq(poll)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Poll" do
        expect {
          post :create, {:poll => valid_attributes}, valid_session
        }.to change(Poll, :count).by(1)
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
    end
  end

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

  describe "DELETE #destroy" do
    it "destroys the requested poll" do
      poll = Poll.create! valid_attributes
      expect {
        delete :destroy, {:id => poll.to_param}, valid_session
      }.to change(Poll, :count).by(-1)
    end

    it "redirects to the polls list" do
      poll = Poll.create! valid_attributes
      delete :destroy, {:id => poll.to_param}, valid_session
      expect(response).to redirect_to(polls_url)
    end
  end
=end

end
