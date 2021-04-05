class Question < ApplicationRecord
  belongs_to :survey, touch: true
  acts_as_list scope: :survey

  store :answers, accessors: %i[A B C D E]
end
