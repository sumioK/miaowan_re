require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "access users" do
    it "access signup without login" do
      get "/signup"
      expect(response).to have_http_status(200)
    end

    it "access login without login" do
      get login_path
      expect(response).to have_http_status(200)
    end

    it "can not access index without login" do
      get users_index_path 
      expect(response).to have_http_status(302)
    end

    it "can not access show without login"

    it "can not access edit without login"

    it "can not access delete without login"

    it "can not access logout without login"
  end
end
