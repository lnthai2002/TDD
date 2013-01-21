class Person < ActiveRecord::Base
  attr_accessible :first_name, :middle_name, :last_name
  validates :first_name,:last_name, :presence=>true
  has_many :addresses
  def full_name
    return "#{first_name} #{middle_name.to_s} #{last_name}"
  end

  def self.find_name_started_with(string)
    return self.where(["first_name LIKE :pattern OR last_name LIKE :pattern", {:pattern=>"#{string}%"}])
  end

  def items_bought
    i = Item.joins(:order).where(:orders=>{:customer_id=>self.id}).all
    puts i
    i
  end
end
