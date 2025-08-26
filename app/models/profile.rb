class Profile < ApplicationRecord
  belongs_to :user
  enum :gender, { men: 0, women: 1, other: 2 }, prefix: true
  has_one_attached :avatar

  def age
    return "不明" unless birthday.present?
    years = Time.zone.now.year - birthday.year
    days = Time.zone.now.yday - birthday.yday
    if days < 0
      "#{years - 1} さい"
    else
      "#{years} さい"
    end
  end
end
