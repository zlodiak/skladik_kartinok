require 'spec_helper'

describe Poll do
  let(:poll) { create :poll, :poll_with_status_poll_0 }

  it "has a valid factory" do
    expect(FactoryGirl.create(:poll)).to be_valid
  end

  describe 'associations' do
   it "belongs_to user" do
      should belong_to(:user)
   end

   it "belongs_to status_poll" do
      should belong_to(:status_poll)
   end  

   it "has_many images" do
      should have_many(:images)
   end     
  end  

  describe 'title' do
    it "is invalid without title" do
      expect(FactoryGirl.build(:poll, title: nil)).not_to be_valid
    end  

    it "is invalid with short title" do
      expect(FactoryGirl.build(:poll, title: 'q')).not_to be_valid
    end      

    it "is invalid with duplicate title" do
      FactoryGirl.create(:poll, title: 'qwerty')
      expect(FactoryGirl.build(:poll, title: 'qwerty')).not_to be_valid
    end 

    it "is valid with different title" do
      FactoryGirl.create(:poll, title: 'zxcvbn')
      expect(FactoryGirl.build(:poll, title: 'asdfgh')).to be_valid
    end        
  end  
  
  describe 'description' do
    it "is invalid without description" do
      expect(FactoryGirl.build(:poll, description: nil)).not_to be_valid
    end   

    it "is invalid with short description" do
      expect(FactoryGirl.build(:poll, description: 'a')).not_to be_valid
    end   

    it "is invalid with long description" do
      expect(FactoryGirl.build(:poll, description: 'When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.')).not_to be_valid
    end       
  end    
end