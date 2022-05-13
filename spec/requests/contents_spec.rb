require 'rails_helper'

RSpec.describe "contents", type: :request do
  describe 'HTTPリクエスト /URL' do
    let!(:content) { create(:content) }
    let(:user) { create(:user) }
    let(:genre) { create(:genre) }

    before do
      sign_in user
    end

    context 'レスポンスが成功していること' do
      it 'index.html.erb' do
        get contents_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'new.html.erb' do
        get new_content_path(genre_id: genre.id)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'edit.html.erb' do
        get edit_content_path(content, genre_id: genre.id)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@contentが取得できていること' do
      it 'index.html.erb' do
        get contents_path
        expect(response.body).to include content.title
        expect(response.body).to include content.author
      end
      it 'edit.html.erb' do
        get edit_content_path(content, genre_id: genre.id)
        expect(response.body).to include content.title
        expect(response.body).to include content.author
      end
    end
  end
end
