class Room < ApplicationRecord
  belongs_to :property
  has_many :approaches, dependent: :destroy
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :construction_time
end
