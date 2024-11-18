class Rental < ApplicationRecord
  enum status: { pending:'pending', accepted: 'accepted', declined: 'declined' }, _default: :pending
  belongs_to :user
  belongs_to :activity
end
