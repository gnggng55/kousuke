class ConstructionTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '0.5' },
    { id: 3, name: '1.0' },
    { id: 4, name: '1.5' },
    { id: 5, name: '2.0' },
    { id: 6, name: '2.5' },
    { id: 7, name: '3.0' },
    { id: 8, name: '3.5' },
    { id: 9, name: '4.0' },
    { id: 10, name: '4.5' },
    { id: 11, name: '5.0' },
    { id: 12, name: '5.5' },
    { id: 13, name: '6.0' },
    { id: 14, name: '終日' }
  ]

  include ActiveHash::Associations
  has_many :rooms

end

