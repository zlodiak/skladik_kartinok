require 'spec_helper'

describe Album do
  it "has a valid factory" do
    expect(FactoryGirl.create(:album)).to be_valid
  end

  describe 'title' do
    it "is invalid without title" do
      expect(FactoryGirl.build(:album, title: nil)).not_to be_valid
    end  

    it "is invalid with duplicate title" do
      FactoryGirl.create(:album, title: 'qwerty')
      expect(FactoryGirl.build(:album, title: 'qwerty')).not_to be_valid
    end 

    it "is valid with different title" do
      FactoryGirl.create(:album, title: 'zxcvbn')
      expect(FactoryGirl.build(:album, title: 'asdfgh')).to be_valid
    end        
  end        

  describe 'description' do
    it "is invalid without description" do
      expect(FactoryGirl.build(:album, description: nil)).not_to be_valid
    end   

    it "is invalid with long description" do
      expect(FactoryGirl.build(:album, description: 'When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.When testing validations, use  have(x).errors_on  to specify the attibute which should be validated. Using  be_valid  does not guarantee that the problem is in the intended attribute.')).not_to be_valid
    end       
  end 

  describe 'associations' do
   it "belongs_to user" do
      should belong_to(:user)
   end

   it "has_many images" do
      should have_many(:images)
   end   
  end  
end