require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "トップページ" do
    let(:user) { create(:user) }

    before do
      sign_in user
      get root_path
    end

    it "レスポンスが成功していること" do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:success)
    end
  end
end
