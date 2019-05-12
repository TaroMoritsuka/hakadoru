class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :shop_id
      t.string :name
      t.string :name_kana
      t.string :url
      t.string :url_mobile
      t.string :image_url
      t.string :address
      t.string :tel
      t.string :opentime
      t.string :holiday

      t.timestamps
    end
  end
end
