require 'spec_helper'

describe Customer do
  it "can store orders" do
    c = FactoryGirl.create(:customer)
    o = []
    o << FactoryGirl.build(:order)
    o << FactoryGirl.build(:order)
    lambda{
      c.orders = o
      c.save  
    }.should change {Order.count}.by(2)
  end

  it "is a person in database" do
    c = FactoryGirl.create(:customer)
    (c.should be_is_a(Person)) && (Person.find(c.id).should_not be_nil)
  end
end
