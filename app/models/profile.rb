class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :name, :grade, :gender
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
