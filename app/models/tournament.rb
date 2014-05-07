class Tournament < ActiveRecord::Base
  has_many :matches

  accepts_nested_attributes_for :matches

end
