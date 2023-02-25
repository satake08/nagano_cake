class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer  :order_id,    null: false, default: ""
      t.string   :item_name,   null: false, default: ""
      t.integer  :item_price,  null: false, default: ""
      t.integer  :quantity,    null: false, default: ""
      t.integer  :item_status, null: false, default: 0
      # enum設定 ０= 着手不可、１= 製作待ち、２= 製作中、３= 製作完了 初期値は0(着手不可)
      t.timestamps
    end
  end
end
