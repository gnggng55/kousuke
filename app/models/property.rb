class Property < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :parking
  belongs_to :gas
  

  def self.search(search)
    if search != ""
      Property.where('property_name LIKE(?)', "%#{search}%")
    else
      Property.all
    end
  end

end
