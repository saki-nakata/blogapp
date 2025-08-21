# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  title      :string           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#



class Article < ApplicationRecord
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :title, format: { with: /\A(?!\@)/ }

  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true

  validate :title_cannot_include
  validate :validate_title_and_content_length

  belongs_to :user

  def display_created_at
    I18n.l(self.created_at, format: :long)
  end

  def user_name
    user.get_name
  end

  private def validate_title_and_content_length
    length_count = self.title.length + self.content.length
    if length_count < 15
      errors.add(:content, '15文字以上にしてください!')
    end
  end

  private def title_cannot_include
    if title.include?('*')
      errors.add(:title, '*を含めることはできません。')
    end
  end
end
