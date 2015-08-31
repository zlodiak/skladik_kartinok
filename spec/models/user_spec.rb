require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
  end  
  
  it "is invalid without email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end     

  describe 'associations' do
   it "belongs_to status" do
      should belong_to(:status)
   end

   it "has_many images" do
      should have_many(:images)
   end 

   it "has_many albums" do
      should have_many(:albums)
   end 

   it "has_many polls" do
      should have_many(:polls)
   end           
  end  

  describe 'avatar' do
    it "is valid when avatar is empty" do
      expect(FactoryGirl.build(:user, 
        avatar_file_name: nil
      )).to be_valid
    end         
  end  
end  