class Room < ApplicationRecord
  belongs_to :property
  has_many :approaches
  has_many_attached :images
end
