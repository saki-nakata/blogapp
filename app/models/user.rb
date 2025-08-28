class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_articles, through: :likes, source: :article

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def has_written?(article)
	  articles.exists?(id: article.id)
  end

  def has_liked?(article)
    likes.exists?(article_id:article.id)
  end

  def get_name
    profile&.nickname || self.email.split("@").first
  end

  def present_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

end
