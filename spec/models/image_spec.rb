require 'spec_helper'

describe Image do
  it "has a valid factory" do
    expect(FactoryGirl.create(:image)).to be_valid
  end

  describe 'image' do
    it "is invalid when image is empty" do
      expect(FactoryGirl.build(:image, 
        image_file_name: nil
      )).not_to be_valid
    end  

    it "is invalid when image filesize more than 5MB" do
      expect(FactoryGirl.build(:image, 
        image_file_size: 6.megabytes
      )).not_to be_valid
    end     

    it "is invalid when image content_type is not: png, gif,jpg" do
      expect(FactoryGirl.build(:image, 
        image_content_type: 'png'
      )).not_to be_valid
    end     
  end  

  describe 'associations' do
   it "belongs_to user" do
      should belong_to(:user)
   end

   it "belongs_to poll" do
      should belong_to(:poll)
   end

   it "belongs_to album" do
      should belong_to(:album)
   end  
  end  
end