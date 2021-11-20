class Property < ApplicationRecord
  has_many :room

  validates :property_name, presence: true,

  def self.search(search)
    if search != ""
      Property.where('text LIKE(?)', "%#{search}%")
    else
      Property.all
    end
  end
end
