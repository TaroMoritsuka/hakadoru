class CreateSmallRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :small_regions do |t|
      t.string :pref_code
      t.string :areacode_s
      t.string :areaname_s

      t.timestamps
    end
  end
end
