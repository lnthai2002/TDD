# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer FactoryGirl.build(:customer)
    items [FactoryGirl.build(:item),FactoryGirl.build(:item)]
  end
end
