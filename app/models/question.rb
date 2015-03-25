class Question < ActiveRecord::Base
  belongs_to :Category

  has_many :Answers, dependent: :destroy
  has_many :Hints, dependent: :destroy
  
end
