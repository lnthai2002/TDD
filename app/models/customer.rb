class Customer < Person
  # attr_accessible :title, :body
  has_many :orders
end
