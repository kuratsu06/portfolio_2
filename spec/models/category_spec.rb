require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category Modelのテスト' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:genre) { create(:genre) }

    context 'バリテーションのテスト' do
      it 'user_id, genre_id, nameがあれば有効であること' do
        expect(category).to be_valid
      end
      it 'user_idがなければ無効であること' do
        category.user_id = nil
        expect(category.valid?).to eq(false)
      end
      it 'genre_idがなければ無効であること' do
        category.genre_id = nil
        expect(category.valid?).to eq(false)
      end
      it 'nameがなければ無効であること' do
        category.name = nil
        expect(category.valid?).to eq(false)
      end
    end

    context "検索機能のテスト" do
      it "検索文字列に完全一致する結果を表示すること" do
        expect(Category.search("MyString")).to include(category)
      end
      it "検索文字列に部分一致する結果を表示すること" do
        expect(Category.search("M")).to include(category)
      end
      it "検索文字列が一致しない場合、何も表示しないこと" do
        expect(Category.search("あ")).to be_empty
      end
      it "検索文字列が空白の場合、全て表示すること" do
        expect(Category.search("")).to include(category)
      end
    end
  end
end
