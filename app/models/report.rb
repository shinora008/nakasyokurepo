class Report < ApplicationRecord
  belongs_to :user, inverse_of: :reports
  belongs_to :shop, inverse_of: :reports
  has_many :comments, dependent: :destroy,
  inverse_of: :report
  accepts_nested_attributes_for :comments
  default_scope -> {order(created_at: :desc)}

  validates_presence_of :user
  validates_presence_of :shop
  validates :dish_name, presence: true, length: { maximum: 30 }
  validates :service, presence: true, length: { maximum: 30 }
  validates :price, numericality: :only_integer
end
