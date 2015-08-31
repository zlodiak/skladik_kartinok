require 'spec_helper'

describe Album do
  it "has a valid factory" do
    expect(FactoryGirl.create(:album)).to be_valid
  end

  it "is invalid without title" do
    expect(FactoryGirl.build(:album, title: nil)).not_to be_valid
  end  

  it "is invalid without description" do
    expect(FactoryGirl.build(:album, description: nil)).not_to be_valid
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