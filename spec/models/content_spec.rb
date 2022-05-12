require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'Content Modelのテスト' do
    let(:content) { create(:content) }
    let(:user) { create(:user) }
    let(:genre) { create(:genre) }
    let(:category) { create(:category) }

    context 'バリテーションのテスト' do
      it 'user_id, genre_id, category_id, title, authorがあれば有効であること' do
        expect(content).to be_valid
      end
      it "titleが20文字以内である場合、有効であること" do
        content.title = "1" * 20
        expect(content).to be_valid
      end
      it 'user_idがなければ無効であること' do
        content.user_id = nil
        expect(content.valid?).to eq(false)
      end
      it 'genre_idがなければ無効であること' do
        content.genre_id = nil
        expect(content.valid?).to eq(false)
      end
      it 'category_idがなければ無効であること' do
        content.category_id = nil
        expect(content.valid?).to eq(false)
      end
      it 'titleがなければ無効であること' do
        content.title = nil
        expect(content.valid?).to eq(false)
      end
      it "titleが21文字以上である場合、無効であること" do
        content.title = "1" * 21
        expect(content.valid?).to eq(false)
      end
      it 'authorがなければ無効であること' do
        content.author = nil
        expect(content.valid?).to eq(false)
      end
    end

    context "検索機能のテスト" do
      it "検索文字列に完全一致する結果を表示すること" do
        expect(Content.search("MyString")).to include(content)
      end
      it "検索文字列に部分一致する結果を表示すること" do
        expect(Content.search("M")).to include(content)
      end
      it "検索文字列が一致しない場合、何も表示しないこと" do
        expect(Content.search("あ")).to be_empty
      end
      it "検索文字列が空白の場合、全て表示すること" do
        expect(Content.search("")).to include(content)
      end
    end
  end
end
