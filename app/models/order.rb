class Order < ActiveRecord::Base
  attr_accessible :customer
  belongs_to :customer
  has_many :items
  validates :customer, :presence=>true
  validate :contains_at_least_one_item

private
  def contains_at_least_one_item
    if self.items.size < 1
      errors.add(:items, "should be at least one")
    end
  end
end
