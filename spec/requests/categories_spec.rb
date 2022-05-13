require 'rails_helper'

RSpec.describe "categories", type: :request do
  describe 'HTTPリクエスト /URL' do
    let!(:category) { create(:category) }
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    context 'レスポンスが成功していること' do
      it 'index.html.erb' do
        get categories_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'new.html.erb' do
        get new_category_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'edit.html.erb' do
        get edit_category_path(category)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@categoryが取得できていること' do
      it 'index.html.erb' do
        get categories_path
        expect(response.body).to include category.name
      end
      it 'edit.html.erb' do
        get edit_category_path(category)
        expect(response.body).to include category.name
      end
    end
  end
end
