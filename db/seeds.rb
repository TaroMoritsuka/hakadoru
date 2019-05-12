# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Prefecture
File.open(Rails.root.join('db/fixtures/prefectures.json')) do |io|
  prefs = JSON.parse(io.read)['pref']

  prefs.each do |pref|
    Prefecture.create!(pref_code: pref['pref_code'], pref_name: pref['pref_name'], area_code: pref['area_code'])
  end
end

# LargeRegion
File.open(Rails.root.join('db/fixtures/large_regions.json')) do |io|
  regions = JSON.parse(io.read)['garea_large']

  regions.each do |region|
    LargeRegion.create!(pref_code: region['pref']['pref_code'], areacode_l: region['areacode_l'], areaname_l: region['areaname_l'])
  end
end

# MediumRegion
File.open(Rails.root.join('db/fixtures/medium_regions.json')) do |io|
  regions = JSON.parse(io.read)['garea_middle']

  regions.each do |region|
    MediumRegion.create!(pref_code: region['pref']['pref_code'], areacode_m: region['areacode_m'], areaname_m: region['areaname_m'])
  end
end

# SmallRegiion
File.open(Rails.root.join('db/fixtures/small_regions.json')) do |io|
  regions = JSON.parse(io.read)['garea_small']

  regions.each do |region|
    SmallRegion.create!(pref_code: region['pref']['pref_code'], areacode_s: region['areacode_s'], areaname_s: region['areaname_s'])
  end
end