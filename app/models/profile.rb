class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo do |attachable|
    attachable.variant :small, resize: "300x300"
  end

  validates_presence_of :name
  validates_inclusion_of :grade, in: 9..12, message: "must be between 9 and 12"
  validate :must_like_some_gender

  enum gender: %i[female male nonbinary]

  def sexuality
    likes = []
    if likes_women
      likes << "women"
    end
    if likes_men
      likes << "men"
    end
    if likes_nonbinary
      likes << "nonbinary people"
    end
    return likes.to_sentence
  end

  private
    def must_like_some_gender
      unless likes_women || likes_men || likes_nonbinary  # if sexuality.blank
        errors.add(:base, "You must select at least one gender to match with")
      end
    end
end
