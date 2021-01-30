# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report, type: :model do
  let!(:report_yesterday) { create(:report, :yesterday) }
  let!(:report_one_week_ago) { create(:report, :one_week_ago) }
  let!(:report_one_month_ago) { create(:report, :one_month_ago) }
  let!(:report) { create(:report) }

  context 'バリデーション' do
    it '有効な状態であること' do
      expect(report).to be_valid
    end

    it '料理名がなければ無効な状態であること' do
      report = build(:report, dish_name: nil)
      report.valid?
      expect(report.errors[:dish_name]).to include('を入力してください')
    end

    it '料理名が30文字以内であること' do
      report = build(:report, dish_name: 'あ' * 31)
      report.valid?
      expect(report.errors[:dish_name]).to include('は30文字以内で入力してください')
    end

    it 'サービス名がなければ無効な状態であること' do
      report = build(:report, service: nil)
      report.valid?
      expect(report.errors[:service]).to include('を入力してください')
    end

    it 'サービス名が30文字以内であること' do
      report = build(:report, service: 'あ' * 31)
      report.valid?
      expect(report.errors[:service]).to include('は30文字以内で入力してください')
    end

    it '値段が半角数字以外入力受け付けないこと' do
      report = build(:report, price: 'あ')
      report.valid?
      expect(report.errors[:price]).to include('は数値で入力してください')
    end
  end

  context '並び順' do
    it '最も最近の投稿が最初の投稿になっていること' do
      expect(report).to eq Report.first
    end
  end
end
