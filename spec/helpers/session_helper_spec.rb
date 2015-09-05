require 'rails_helper'
require 'helpers/application_helper_spec'

RSpec.configure do |c|
  c.include Helpers
end


describe PollsHelper do
  describe "sessions helpers" do
    it "for admin status user return true" do
      login_admin
      expect(@user.status_id).to eq(2)
    end           

    it "for manager status user return true" do
      login_manager
      expect(@user.status_id).to eq(1)
    end           

    it "for user status user return true" do
      login_user
      expect(@user.status_id).to eq(0)
    end                   
  end
end


