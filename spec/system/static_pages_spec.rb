require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "正しいタイトルが表示されていることを確認" do
        expect(page).to have_title full_title
      end
    end
  end
end
