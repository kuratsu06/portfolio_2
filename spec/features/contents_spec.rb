require 'rails_helper'

RSpec.feature "contents", type: :feature do
  describe '新規作成と更新' do
    let(:user) { create(:user) }
    let(:content) { create(:content, user_id: user.id) }
    let(:genre) { create(:genre) }

    scenario 'ログインしないと、コンテンツページを見れない' do
      visit contents_path
      expect(current_path).not_to eq contents_path
      expect(current_path).to eq new_user_session_path
    end

    scenario 'ログインしたあと、新規作成ができる' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input.btn-primary').click
      expect(current_path).to eq root_path

      visit contents_path
      click_on "NOVEL 登録"
      expect(current_path).to eq new_content_path
      visit new_content_path(genre_id: genre.id)
      fill_in 'content[title]', with: "MyString"
      fill_in 'content[author]', with: "MyString"
      click_on "登録"
      expect(content.reload.title).to eq "MyString"
      expect(content.reload.author).to eq "MyString"
    end

    scenario 'ログインしたあと、編集ができる' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input.btn-primary').click
      expect(current_path).to eq root_path

      visit contents_path(content)
      click_on "編集"
      expect(current_path).to eq edit_content_path(content)
      fill_in 'content[title]', with: "MyString"
      fill_in 'content[author]', with: "MyString"
      click_on "更新"
      expect(content.reload.title).to eq "MyString"
      expect(content.reload.author).to eq "MyString"
    end
  end
end
