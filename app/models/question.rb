class Question < ApplicationRecord
  belongs_to :survey, touch: true
  acts_as_list scope: :survey
  has_many :responses

  serialize :answers, Array

  validates_presence_of :question, :answers
  # validates_length_of :answers, maximum: 6
end
