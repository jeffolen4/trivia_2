class Question < ActiveRecord::Base
  belongs_to :category

  paginates_per 5
  has_many :answers, dependent: :destroy
  has_many :hints, dependent: :destroy

  validates :question, presence: true

  accepts_nested_attributes_for :answers,
    :allow_destroy => true,
    :reject_if => :all_blank

  accepts_nested_attributes_for :hints,
    :allow_destroy => true,
    :reject_if => :all_blank

end
