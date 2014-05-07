class Continent < ActiveRecord::Base
  has_many :countries

  accepts_nested_attributes_for :countries


end
