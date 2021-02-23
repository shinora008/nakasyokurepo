require 'rails_helper'

RSpec.describe 'StaticPages', type: :system do
  describe 'トップページ' do
    context 'ページ全体' do
      before do
        visit root_path
      end

      it "なか食レポの文字列が存在することを確認" do
        expect(pages).to have_content 'なか食レポ'
      end
      it '正しいタイトルが表示されていることを確認' do
        expect(page).to have_title full_title
      end
    end
  end

  describe "ヘルプページ" do
    before do
      visit about_path
    end
    it "なか食レポとは？の文字列が存在することを確認" do
      expect(page).to have_title full_title('なか食レポとは？')
    end
  end

  describe "利用規約ページ" do
    before do
      visit use_of_terms_path
    end

    it "利用規約の文字列が存在することを確認" do
      expect(page).to have_content '利用規約'
    end

    it "正しいタイトルが表示されていることを確認" do
      expect(page).to have_title full_title('利用規約')
    end
  end
end
