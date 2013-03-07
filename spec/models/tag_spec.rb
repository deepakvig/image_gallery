require 'spec_helper'

describe Tag do

  it "is valid with content" do
    expect( FactoryGirl.build(:album_tag) ).to be_valid
  end
   
end
