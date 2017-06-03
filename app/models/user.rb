class User < ApplicationRecord
  has_many :dreams
  has_attachment :avatar
  has_many :likes
  has_many :liked_dreams, through: :likes, source: :dream
  has_many :relationships
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:avatar_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def liked?(dream)
    likes.where(dream: dream).exists?
  end

  def followed?(other_user)
    active_relationships.where(followed_id: other_user).exists?
  end

  def contributed?(dream)
    user_contributors = dream.contributors.map do |contributor|
      contributor.user
    end
    user_contributors.include?(self)
  end

  def has_dream_in?(category)
    dreams = self.dreams
    dreams.where(category: category).exists?
  end

  def loved_dream_in?(category)
    liked_dreams.where(category: category).exists?
  end

  def categories
    @categories = []
    Dream::CATEGORIES.each do |category|
      if self.has_dream_in?(category)
        @categories << category
      end
    end
    return @categories
  end

  def categories_liked
    @categories = []
    Dream::CATEGORIES.each do |category|
      if self.loved_dream_in?(category)
        @categories << category
      end
    end
    return @categories
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
