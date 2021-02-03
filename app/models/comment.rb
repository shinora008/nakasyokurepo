class Comment < ApplicationRecord
  # belongs_to :user, inverse_of: :comments
  # belongs_to :shop, inverse_of: :comments
  belongs_to :report, inverse_of: :comments
  default_scope -> { order(created_at: :desc) }

  # validates :user_id, presence: true
  # validates :shop_id, presence: true
  # validates :report_id, presence: true
  validates :title, presence: true, length:{ maximum: 50 }
  validates :report_comment, presence: true
end
