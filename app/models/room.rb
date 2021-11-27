class Room < ApplicationRecord
  belongs_to :property
  has_many :approaches, dependent: :destroy
  has_many_attached :images
end
