class Property < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many_attached :images


  def self.search(search)
    if search != ""
      Property.where('text LIKE(?)', "%#{search}%")
    else
      Property.all
    end
  end

end
