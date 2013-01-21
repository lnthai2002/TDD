require 'spec_helper'

describe Address do

  before(:each) do
    @valid_address = {:state=>'CA', :city=>'LA', :street=>'Dota', :zip=>'123456789'}
  end
  it "should have State" do
    a = Address.new
    a.should_not be_valid
    a.errors[:state].should_not be_nil
  end
  it "should have state with 2 letters" do
    a = Address.new(:state=>'WTF')
    a.should_not be_valid
    a.errors[:state].should_not be_nil
  end
  
  it "should default country to USA if blank" do
    a = Address.new(@valid_address)
    a.save
    a.country.should == 'USA'
  end
  
  [:street, :city, :zip].each do |part|
    it "must have #{part}" do
      a = Address.new
      a.should_not be_valid
      a.errors[part].should_not be_blank
    end
  end
end
