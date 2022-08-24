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
    it "is invalid with a duplicate email"
end