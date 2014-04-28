class Setting < ActiveRecord::Base
  has_one :user
  belongs_to :timezone
  belongs_to :role
  belongs_to :language
end
