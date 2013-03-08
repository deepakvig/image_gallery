require 'spec_helper'

describe Photo do

  it "is valid with caption, description and image" do
    expect( FactoryGirl.build(:photo) ).to be_valid
  end

  it "is invalid without caption" do
    expect( FactoryGirl.build(:photo, caption: nil) ).to have(1).errors_on(:caption)
  end

  it "is invalid without description" do
    expect( FactoryGirl.build(:album, description: nil) ).to have(1).errors_on(:description)
  end

  it "is invalid without image" do
    expect( FactoryGirl.build(:photo, image: nil ) ).to have(1).errors_on(:image)
  end
end
