class Item < ActiveRecord::Base
  attr_accessible :name, :price
  belongs_to :order
  validates :name,:price, :presence=>true
end
