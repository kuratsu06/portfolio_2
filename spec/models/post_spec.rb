require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post Modelのテスト' do
    let(:post) { create(:post) }
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:content) { create(:content) }

    context 'バリテーションのテスト' do
      it 'user_id, category_id, content_id, subtitle, diaryがあれば有効であること' do
        expect(post).to be_valid
      end
      it "subtitleが20文字以内である場合、有効であること" do
        post.subtitle = "1" * 20
        expect(post).to be_valid
      end
      it "diaryが5000文字以内である場合、有効であること" do
        post.diary = "1" * 5000
        expect(post).to be_valid
      end
      it 'user_idがなければ無効であること' do
        post.user_id = nil
        expect(post.valid?).to eq(false)
      end
      it 'category_idがなければ無効であること' do
        post.category_id = nil
        expect(post.valid?).to eq(false)
      end
      it 'content_idがなければ無効であること' do
        post.content_id = nil
        expect(post.valid?).to eq(false)
      end
      it 'subtitleがなければ無効であること' do
        post.subtitle = nil
        expect(post.valid?).to eq(false)
      end
      it "subtitleが21文字以上である場合、無効であること" do
        post.subtitle = "1" * 21
        expect(post.valid?).to eq(false)
      end
      it 'diaryがなければ無効であること' do
        post.diary = nil
        expect(post.valid?).to eq(false)
      end
      it "diaryが5001文字以上である場合、無効であること" do
        post.diary = "1" * 5001
        expect(post.valid?).to eq(false)
      end
    end

    context "検索機能のテスト" do
      it "検索文字列に完全一致する結果を表示すること" do
        expect(Post.search("MyString")).to include(post)
      end
      it "検索文字列に部分一致する結果を表示すること" do
        expect(Post.search("M")).to include(post)
      end
      it "検索文字列が一致しない場合、何も表示しないこと" do
        expect(Post.search("あ")).to be_empty
      end
      it "検索文字列が空白の場合、全て表示すること" do
        expect(Post.search("")).to include(post)
      end
    end
  end
end
