class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      #外部キー会員ID
      t.integer  :product_id,     null: false, default: ""

      t.string   :post_code,      null: false, default: ""
      t.string   :address,        null: false, default: ""
      t.string   :address_name,   null: false, default: ""
      t.integer  :postage,        null: false, default: ""
      t.integer  :total_price,    null: false, default: ""

      #支払方法
      t.integer  :payment_method, null: false, default: 0
      # e_num設定 ０= クレジットカード、１= 銀行振込

      #受注ステータス
      t.integer  :order_status,   null: false, default: 0
      # e_num設定 ０= 入金待ち、１= 入金確認、２= 製作中、３= 発送準備中、４= 発送済み 登録時は0(入金待ち)
      t.timestamps
    end
  end
end
