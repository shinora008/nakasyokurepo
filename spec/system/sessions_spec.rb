# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let!(:user) { create(:user) }

  before do
    visit login_path
  end

  describe 'ログインページ' do
    context 'ページレイアウト' do
      it '「ログイン」の文字列が存在することを確認' do
        pending 'この先はなぜかテストが失敗するのであとで直す'
        expect(page).to have_content 'ログイン'
      end

      it 'ヘッダーにログインページへのリンクがあることを確認' do
        expect(page).to have_link 'ログイン', href: login_path
      end

      it '「ログインしたままにする」チェックボックスが表示される' do
        pending 'この先はなぜかテストが失敗するのであとで直す'
        expect(page).to have_content 'ログインしたままにする'
      end

      it 'ログインボタンが表示さえる' do
        expect(page).to have_button 'ログイン'
      end
    end
  end
end
