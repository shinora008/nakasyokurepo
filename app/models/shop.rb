# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :menus, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, length: { maximum: 100 }
  validates :opening_hour, length: { maximum: 100 }
end
