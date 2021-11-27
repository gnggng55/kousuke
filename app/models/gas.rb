class Gas < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '都市ガス' },
    { id: 3, name: 'プロパン' }
  ]

  include ActiveHash::Associations
  has_many :properties

  end