class PropertyKind < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'マンション' },
    { id: 3, name: 'アパート' },
    { id: 4, name: '戸建て' },
    { id: 5, name: '店舗等・その他'}
  ]

  include ActiveHash::Associations
  has_many :properties

end
  