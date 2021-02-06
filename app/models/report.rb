# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :dish_name, presence: true, length: { maximum: 30 }
  validates :service, presence: true, length: { maximum: 30 }
  validates :price, numericality: :only_integer
end
