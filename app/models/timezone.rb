class Timezone < ActiveRecord::Base
  has_many :cities
  has_many :matches
  has_many :settings

  accepts_nested_attributes_for :cities, :matches, :settings

end
