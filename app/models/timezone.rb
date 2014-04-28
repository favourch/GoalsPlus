class Timezone < ActiveRecord::Base
  has_many :cities
  has_many :matches
  has_many :users
end
