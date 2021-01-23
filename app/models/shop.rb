class Shop < ApplicationRecord
  has_many :reports, dependent: :destroy
  validates :shopname, presence: true, length: { maximum: 50 }
  validates :shopaddress, length:  { maximum: 100 }
  validates :opening_hour, length: { maximum: 100 }
  validates :service, presence: true , length: { maximum: 50}
end
