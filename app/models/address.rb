class Address < ActiveRecord::Base
  attr_accessible :state, :country, :city, :street, :zip
  before_save :set_default_country
  validates :state, :presence=>true, :length=>{:is=>2}
  validates :street, :city, :zip, :presence=>true
  belongs_to :person
private
  def set_default_country
    if self.country.blank?
      self.country = 'USA'
    end
  end
end
