class Profile < ApplicationRecord
  belongs_to :user
  enum :gender, { men: 0, women: 1, other: 2 }, prefix: true
end
