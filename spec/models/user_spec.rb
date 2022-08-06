require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryBot.build(:user)
    end

    it "is calid with a email and password" do
        expect(@user).to be_valid

    end
end