class Survey < ApplicationRecord
	has_many :questions, -> { order(position: :asc) }
end
