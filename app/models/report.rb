# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :menu
  belongs_to :delivery_provider
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates :menu_id, presence: true
  validates :delivery_provider_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :comment, presence: true
end
