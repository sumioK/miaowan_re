class User < ApplicationRecord
validates :introduction, length: {maximum: 250}
validates :name, presence: true
validates :password, presence: true

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_many :relationships, foreign_key: :following_id
    has_many :followings, through: :relationships, source: :follower

    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers, through: :reverse_of_relationships, source: :following

    def is_followed_by?(user)
        reverse_of_relationships.find_by(following_id: user.id).present?
    end


end