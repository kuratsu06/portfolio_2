require 'rails_helper'

RSpec.feature "posts", type: :feature do
  describe '新規作成と更新' do
    let(:post) { create(:post) }
    let(:user) { create(:user) }
    let(:content) { create(:content) }

    scenario 'ログインしないと、日記ページを見れない' do
      visit posts_path
      expect(current_path).not_to eq posts_path
      expect(current_path).to eq new_user_session_path
    end

    scenario 'ログインしたあと、新規作成ができる' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input.btn-primary').click
      expect(current_path).to eq root_path

      visit contents_path(content)
      click_on "日記を書く"
      expect(current_path).to eq new_post_path
      fill_in 'post[subtitle]', with: "MyString"
      fill_in 'post[diary]', with: "MyText"
      click_on "登録"
      expect(post.reload.subtitle).to eq "MyString"
      expect(post.reload.diary).to eq "MyText"
    end

    scenario 'ログインしたあと、編集ができる' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input.btn-primary').click
      expect(current_path).to eq root_path

      visit posts_path(post)
      click_on "編集"
      expect(current_path).to eq edit_post_path(post)
      fill_in 'post[subtitle]', with: "MyString"
      fill_in 'post[diary]', with: "MyText"
      click_on "更新"
      expect(post.reload.subtitle).to eq "MyString"
      expect(post.reload.diary).to eq "MyText"
    end
  end
end
