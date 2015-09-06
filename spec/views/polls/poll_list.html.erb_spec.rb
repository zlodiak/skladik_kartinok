require 'rails_helper'

describe "polls/poll_list.html.erb" do
  before do
    @user = FactoryGirl.create(:user)
    @polls = FactoryGirl.create(:poll, user_id: @user.id) 
    assign :polls, @polls
 
    render :template => "polls/poll_list.html.erb"
  end

  it "render template poll_list" do
    expect(response).to render_template("poll_list")
  end
end