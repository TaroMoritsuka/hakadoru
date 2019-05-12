class MediumRegion < ApplicationRecord
  belongs_to :prefecture, foreign_key: 'pref_code', primary_key: 'pref_code'
end
