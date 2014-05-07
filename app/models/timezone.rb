class Timezone < ActiveRecord::Base
  has_many :cities
  has_many :matches
  has_many :users

  accepts_nested_attributes_for :cities, :matches, :users

end
