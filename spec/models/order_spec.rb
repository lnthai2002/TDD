require 'spec_helper'

describe Order do
  it "can has many items" do
    o = FactoryGirl.create(:order)
    i1 = FactoryGirl.build(:item)
    i2 = FactoryGirl.build(:item)
    i1.order = o
    i2.order = o
    i1.save
    i2.save
    o.items.size.should == 2
  end
  
  it "require a customer" do
    o = Order.new
    o.should_not be_valid
    o.errors[:customer].should_not be_blank
  end

  it "require at least one item" do
    o = Order.new
    o.should_not be_valid
    o.errors[:items].should_not be_blank
  end
end
