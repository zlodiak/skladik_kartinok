require 'rails_helper'
require 'helpers/application_helper_spec'

RSpec.configure do |c|
  c.include Helpers
end


describe PollsHelper do
  describe "string concat" do
    it "get_summary_votes_for_image return value for real images" do
      @image = FactoryGirl.create(:image)
      @image_like = FactoryGirl.create(:image_like, image_id: @image.id)
      expect(ImageLike.where(image_id: @image.id).count()).to eq(1)
    end

    it "get_summary_votes_for_image return nil for fail images" do
      expect(ImageLike.where(image_id: 1).count()).to eq(0)
    end  

    it "return true for voted user" do
      login_user
      @image = FactoryGirl.create(:image, user_id: @user.id)
      @image_like = FactoryGirl.create(:image_like, image_id: @image.id, user_id: @user.id)
      return_value = ImageLike.where(image_id: @image.id, user_id: @user.id).count()
      expect(return_value).to be > 0
    end 

    it "return nil for not voted user" do
      login_user
      return_value = ImageLike.where(image_id: -22, user_id: @user.id).count()
      expect(return_value).to eq(0)
    end            
  end
end


