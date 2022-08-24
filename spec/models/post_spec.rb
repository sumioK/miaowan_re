require 'rails_helper'

RSpec.describe Post, type: :model do
  it "post can post" do
    user = User.create(
      id: 1,
      name: "Jack",
      email: "jack@example.com",
      password: "password",
      introduction: "test"
  )
    post = Post.new(
      user_id: 1,
      image: "sample.jpg",
      content: "test"
    )
    expect(post).to be_valid
  end
  
  it "can not post without images" do
    user = User.create(
      id: 1,
      name: "Jack",
      email: "jack@example.com",
      password: "password",
      introduction: "test"
  )
    post = Post.new(
      user_id: 1,
      image: nil,
      content: "test"
    )
    expect(post).to be_invalid
  end

  it "if update's image is null image doesn't change"

  it "if update has image , image changes"
end
