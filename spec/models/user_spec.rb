require 'spec_helper'

describe User do

  it "is valid with a email and password" do
    expect( FactoryGirl.build(:user) ).to be_valid
  end

  it "is invalid without a email" do
    expect( FactoryGirl.build(:user, email: nil) ).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
    expect( FactoryGirl.build(:user, password: nil) ).to have(1).errors_on(:password)
  end


end
