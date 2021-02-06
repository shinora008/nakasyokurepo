# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :shop
  default_scope -> { order(created_at: :desc) }

  validates :shop_id, presence: true
  validates :dish_name, presence: true
  validates :price, numericality: :only_integer
end
