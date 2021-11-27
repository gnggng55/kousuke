class Parking < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '近くコインP' },
    { id: 3, name: '路駐' },
    { id: 4, name: 'なし' }
  ]

  include ActiveHash::Associations
  has_many :properties

  end