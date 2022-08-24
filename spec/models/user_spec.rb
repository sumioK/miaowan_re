require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryBot.build(:user)
    end

    it "is calid with a email and password" do
        expect(@user).to be_valid
    end

    it "is valid with a name ,email, password, password2" do
        user = User.new(
            name: "Jack",
            email: "jack@example.com",
            password: "password"
        )
        expect(user).to be_valid
    end

    it "is inavalid without a name" do
        user = User.new(
            name: nil
        )
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
    end

    it "is inavalid without a email address" do
        user = User.new(
            email: nil
        )
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
    end
    
    it "is invalid without a fraudulent email address" do
        user = User.new(
            name: "Jack",
            email: "jackexample.com",
            password: "password"
        )
        expect(user).to be_invalid
    end
    
    it "is invalid with a duplicate email" do
        User.create(
            name: "Jack",
            email: "jack@example.com",
            password: "password"
        )
        user = User.new(
            name: "Jhoe",
            email: "jack@example.com",
            password: "password"
        )
        user.valid?
        expect(user.errors[:email]).to include("has already been taken")
    end
end