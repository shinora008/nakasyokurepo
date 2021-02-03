class Shop < ApplicationRecord
  has_many :reports, dependent: :destroy, inverse_of: :shop
  has_many :comments, inverse_of: :shop
  accepts_nested_attributes_for :reports
  accepts_nested_attributes_for :comments


  validates :shopname, presence: true, length: { maximum: 50 }
  validates :shopaddress, length:  { maximum: 100 }
  validates :opening_hour, length: { maximum: 100 }
  validates :service, presence: true , length: { maximum: 50}
end
