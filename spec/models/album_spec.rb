require 'spec_helper'

describe Album do
  it "is valid with title, caption, description and blog_link" do
    expect( FactoryGirl.build(:album) ).to be_valid
  end

  it "is invalid without title" do
    expect( FactoryGirl.build(:album, title: nil) ).to have(1).errors_on(:title)
  end

  it "is invalid without caption" do
    expect( FactoryGirl.build(:album, caption: nil) ).to have(1).errors_on(:caption)
  end

  it "is invalid without description" do
    expect( FactoryGirl.build(:album, description: nil ) ).to have(1).errors_on(:description)
  end

end
