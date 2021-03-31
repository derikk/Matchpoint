class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :name
  validates_inclusion_of :grade, in: 9..12, message: "must be between 9 and 12"
  validate :must_like_some_gender
  validate :acceptable_photo

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
      likes << "non-binary people"
    end
    return likes.to_sentence
  end

  private
    def must_like_some_gender
      unless likes_women || likes_men || likes_nonbinary  # if sexuality.blank
        errors.add(:base, "You must select at least one gender to match with")
      end
    end

    def acceptable_photo
      return unless photo.attached?

      acceptable_types = ["image/jpeg", "image/jpg", "image/png"]
      if not acceptable_types.include?(photo.content_type)
        errors.add(:photo, "must be a JPEG or PNG")

      elsif photo.byte_size > 2.megabytes
        photo_size = (photo.byte_size / 1_000_000.0).round(1)
        errors.add(:photo, "size (#{photo_size} MB) exceeds 2 MB limit")
      end
    end
end
