class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :report
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates :report_id, presence: true
  validates :title, presence: true, length:{ maximum: 50 }
  validates :comment, presence: true
end
