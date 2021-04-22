class Question < ApplicationRecord
  belongs_to :survey, touch: true
  acts_as_list scope: :survey

  store :answers, accessors: %i[A B C D E]
  enum choices: %i[A B C D E]

  validates_presence_of :question
  validates_presence_of %i[A B C D E]
end
