require 'rails_helper'

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
  end
end


