class Item < ApplicationRecord

  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gas
  
end
