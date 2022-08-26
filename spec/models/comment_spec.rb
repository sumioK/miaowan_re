require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "valid" do

    it "can comments while comment" do
      user = User.create(
        id: 1,
        name: "Jack",
        email: "jack@example.com",
        password: "password",
        introduction: "test"
      )
      post = Post.create(
        user_id: 1,
        image: "sample.jpg",
        content: "test"
      )
      comment = Comment.new(
        comment: "test comment",
        user_id: 1,
        post_id: 1
      )
      expect(comment).to be_valid
    end

    it "can't comments without comment" do
      user = User.create(
        id: 1,
        name: "Jack",
        email: "jack@example.com",
        password: "password",
        introduction: "test"
      )
      post = Post.create(
        user_id: 1,
        image: "sample.jpg",
        content: "test"
      )
      comment = Comment.new(
        comment: nil,
        user_id: 1,
        post_id: 1
      )
      expect(comment).to be_invalid
    end

    it "can't updates without comment"

  end

  describe "check method" do

    it "destroy works"

  end
end
