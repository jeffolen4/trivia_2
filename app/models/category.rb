class Category < ActiveRecord::Base
  has_many :Questions, dependent: :destroy

end
