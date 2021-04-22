class Survey < ApplicationRecord
  has_many :questions, -> { order(:position) }, inverse_of: :survey, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :title
end
