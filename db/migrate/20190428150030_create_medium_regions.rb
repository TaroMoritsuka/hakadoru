class CreateMediumRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :medium_regions do |t|
      t.string :pref_code
      t.string :areacode_m
      t.string :areaname_m

      t.timestamps
    end
  end
end
