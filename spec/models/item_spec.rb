require 'spec_helper'

describe Item do
  [:name, :price].each do |attr|
    it "must have a #{attr.to_s}" do
      i = Item.new
      i.should_not be_valid
      i.errors[attr].should_not be_blank
    end
  end
end
