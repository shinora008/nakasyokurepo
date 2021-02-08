# frozen_string_literal: true

class DeliveryProvider < ApplicationRecord
  has_many :reports
end
