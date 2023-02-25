class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      # 外部キー 商品ジャンルのID
      t.integer  :genre_id,    index: true, null: false, default: ""

      t.string   :name,        null: false, default: ""
      t.text     :description
      t.integer  :price,       null: false, default: ""

      # e_num設定 ０ = 販売可、１ = 販売不可　登録時は販売不可
      t.integer  :sale_status, null: false, default: 1

      t.string   :image_id
      t.timestamps
    end
  end
end
