require 'rails_helper'

RSpec.feature "categories", type: :feature do
  describe '新規作成と更新' do
    let(:user) { create(:user) }
    let(:category) { create(:category, user_id: user.id) }

    scenario 'ログインしないと、カテゴリページを見れない' do
      visit categories_path
      expect(current_path).not_to eq categories_path
      expect(current_path).to eq new_user_session_path
    end

    scenario 'ログインしたあと、新規作成ができる' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input.btn-primary').click
      expect(current_path).to eq root_path

      visit categories_path
      click_on "新規登録"
      expect(current_path).to eq new_category_path
      fill_in 'category[name]', with: "MyString"
      click_on "登録"
      expect(category.reload.name).to eq "MyString"
    end

    scenario 'ログインしたあと、編集ができる' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input.btn-primary').click
      expect(current_path).to eq root_path

      visit categories_path(category)
      click_on "編集"
      expect(current_path).to eq edit_category_path(category)
      fill_in 'category[name]', with: "MyString"
      click_on "更新"
      expect(category.reload.name).to eq "MyString"
    end
  end
end
