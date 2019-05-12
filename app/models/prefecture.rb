class Prefecture < ApplicationRecord
  has_many :large_regions, foreign_key: 'pref_code', primary_key: 'pref_code'
end
