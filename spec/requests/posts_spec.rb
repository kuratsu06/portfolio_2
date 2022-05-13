require 'rails_helper'

RSpec.describe "posts", type: :request do
  describe 'HTTPリクエスト /URL' do
    let!(:post) { create(:post) }
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:content) { create(:content) }

    before do
      sign_in user
    end

    context 'レスポンスが成功していること' do
      it 'index.html.erb' do
        get posts_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'new.html.erb' do
        get new_post_path(category_id: category.id, content_id: content.id)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'show.html.erb' do
        get post_path(post)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'edit.html.erb' do
        get edit_post_path(post, category_id: category.id, content_id: content.id)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@postが取得できていること' do
      it 'index.html.erb' do
        get posts_path
        expect(response.body).to include post.subtitle
        expect(response.body).to include post.diary
      end
      it 'show.html.erb' do
        get post_path(post)
        expect(response.body).to include post.subtitle
        expect(response.body).to include post.diary
      end
      it 'edit.html.erb' do
        get edit_post_path(post, category_id: category.id, content_id: content.id)
        expect(response.body).to include post.subtitle
        expect(response.body).to include post.diary
      end
    end
  end
end
