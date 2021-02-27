class Report < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  belongs_to :delivery_provider
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :menu
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :delivery_provider_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :comment, presence: true
  validates :evaluation, presence: true


  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, ':5MBより大きい画像はアップロードできません。')
    end
  end
end
