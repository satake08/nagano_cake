class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      # 外部キージャンルID
      t.integer  :genre_id,    null: false, default: ""

      t.string   :name,        null: false, default: ""
      t.text     :description, null: false, default: ""
      t.integer  :price,       null: false, default: ""

      #販売ステータス true =販売中　false =売切れ
      t.boolean  :is_active,   null: false, default: true

      #必要ないがモデル記述追加忘れないため
      t.string   :image_id
      t.timestamps
    end
  end
end
