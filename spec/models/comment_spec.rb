require 'spec_helper'

describe Comment do
 
  it "is valid with name, email, content" do
    expect( FactoryGirl.build(:album_comment) ).to be_valid
  end

  it "is invalid without name" do
    expect( FactoryGirl.build(:comment, name: nil) ).to have(1).errors_on(:name)
  end

  it "is invalid without email" do
    expect( FactoryGirl.build(:comment, email: nil) ).to_not be_valid
  end

  it "is invalid without content" do
    expect( FactoryGirl.build(:comment, content: nil) ).to have(1).errors_on(:content)
  end

  it "is invalid with invalid email" do
    expect( FactoryGirl.build(:comment_with_invalid_email) ).to have(1).errors_on(:email)
  end

end
