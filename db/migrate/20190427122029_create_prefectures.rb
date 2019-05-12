class CreatePrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :prefectures do |t|
      t.string :pref_code
      t.string :pref_name
      t.string :area_code

      t.timestamps
    end
  end
end
