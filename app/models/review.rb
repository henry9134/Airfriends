class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :friend, class_name: "User"

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5"}
end
