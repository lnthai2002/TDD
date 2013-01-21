require 'spec_helper'

describe Person do
  before(:each) do
    @valid_attrs = {:first_name=>'Tom', :middle_name=>'Gay', :last_name=>'Smith'}
  end
  
  it 'create new instance with valid attribute' do
    lambda{
      a = Person.create(@valid_attrs)
    }.should change {Person.count}.by(1)
  end

  it 'save first name' do
    p = Person.create(:first_name=>'Hitler')
    p.first_name.should == 'Hitler'
  end
  
  [:first_name, :last_name].each do |name|
    it "must have first #{name.to_s}" do
      p = Person.new
      p.should_not be_valid
      p.errors[name].should_not be_blank
    end
  end

  it "can construct full name" do
    p=Person.new(@valid_attrs)
    p.should respond_to :full_name
  end
  
  it 'should return middle name if exist' do
    p = Person.new(@valid_attrs)
    p.full_name.should == 'Tom Gay Smith'
  end
  
  it 'should save correctly' do
    lambda {
      p = Person.create(@valid_attrs)
    }.should change {Person.count}.by(1) 
  end

  it "can have many addresses" do
    p = Person.create(@valid_attrs)
    home = Address.new(:state=>'CA', :city=>'LA', :street=>'Dota', :zip=>'123456789')
    work = Address.new(:state=>'VA', :city=>'LB', :street=>'Dota', :zip=>'123456789')
    home.person = p
    work.person = p
    home.save
    work.save
    p.addresses.should_not be_blank
  end

  it "can make person from factory" do
    p = FactoryGirl.build(:person)
    p.should_not be_nil
    p.should be_kind_of(Person) 
  end
  
  it "should find people by partial name" do
    jonna = FactoryGirl.create(:person, :first_name=>'Jonna', :last_name=>'Smith')
    pan = FactoryGirl.create(:person, :first_name=>'Pan', :last_name=>'Jonh')
    silly = FactoryGirl.create(:person, :first_name=>'Silly', :last_name=>'Shame')
    Person.all.should == [jonna, pan, silly]
    
    Person.find_name_started_with('Jon').should == [jonna, pan]
  end

  it "should be able to find all item he bought" do
    c1 = FactoryGirl.create(:customer)
    c1.orders << FactoryGirl.create(:order)
    c1.orders << FactoryGirl.create(:order)
    c1.save
    
    c2 = FactoryGirl.create(:customer)
    c2.orders << FactoryGirl.create(:order)
    c2.orders << FactoryGirl.create(:order)
    c2.save
    
    p = Person.find(c1.id)
    p.items_bought.should == c1.orders.all.inject{|order| order.items}
  end
end
