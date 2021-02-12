class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  enum gender: %i[female male nonbinary]
  enum sexuality: %i[nobody women men women_and_men nonbinarys women_and_nonbinarys men_and_nonbinarys everybody]
end
