# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :shop
  has_many :reports
  accepts_nested_attributes_for :shop
  default_scope -> { order(created_at: :desc) }
  validates :dish_name, presence: true
  validates :price, numericality: :only_integer
end
