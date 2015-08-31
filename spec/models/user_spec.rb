require 'spec_helper'

describe User do
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
end  