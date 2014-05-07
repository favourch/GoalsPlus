class Country < ActiveRecord::Base
  belongs_to :continent
  has_many :cities

  accepts_nested_attributes_for :cities
end
