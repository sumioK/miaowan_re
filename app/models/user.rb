class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_many :relationships, foreign_key: :following_id
    has_many :followings, through: :relationships, source: :follower

    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers, through: :reverse_of_relationships, source: :following


end