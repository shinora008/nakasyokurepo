# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :comments
  validates :shopname, presence: true, length: { maximum: 50 }
  validates :shopaddress, length:  { maximum: 100 }
  validates :opening_hour, length: { maximum: 100 }
  validates :service, presence: true, length: { maximum: 50 }
end
