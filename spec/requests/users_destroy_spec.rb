# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ユーザーの削除', type: :request do
  let!(:admin_user) { create(:user, :admin) }
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:report) { create(:report, user: user) }

  context '管理者ユーザーの場合' do
    it 'ユーザーを削除後、ユーザー一覧ページにリダイレクト' do
      login_for_request(admin_user)
      expect do
        delete user_path(user)
      end.to change(User, :count).by(-1)
      redirect_to users_url
      follow_redirect!
      expect(response).to render_template('/')
    end
  end

  context '管理者以外のユーザーの場合' do
    it '自分のアカウントを削除できること' do
      login_for_request(user)
      expect do
        delete user_path(user)
      end.to change(User, :count).by(-1)
      redirect_to root_url
    end

    it '自分以外のユーザーを削除しようとすると、トップページへリダイレクトすること' do
      login_for_request(user)
      expect do
        delete user_path(other_user)
      end.not_to change(User, :count)
      expect(response).to have_http_status '302'
      expect(response).to redirect_to root_path
    end
  end

  context 'ログインしていないユーザーの場合' do
    it 'ログインページへリダイレクトすること' do
      expect do
        delete user_path(user)
      end.not_to change(User, :count)
      expect(response).to have_http_status '302'
      expect(response).to redirect_to login_path
    end
  end

  context 'レポートが紐づくゆーざーを削除した場合' do
    it 'ユーザーと同時に紐づくレポートも削除される' do
      login_for_request(user)
      expect do
        delete user_path(user)
      end.to change(Report, :count).by(-1)
    end
  end
end
