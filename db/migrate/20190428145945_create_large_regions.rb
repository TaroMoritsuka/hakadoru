class CreateLargeRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :large_regions do |t|
      t.string :pref_code
      t.string :areacode_l
      t.string :areaname_l

      t.timestamps
    end
  end
end
