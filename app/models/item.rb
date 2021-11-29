class Item < ApplicationRecord

  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gas
  

  def self.search(search)
    if search != ""
      Item.where('product_number LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
