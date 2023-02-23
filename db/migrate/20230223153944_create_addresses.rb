class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id,   null: false, default: ""
      #外部キー会員ID
      
      t.string  :last_name,     null: false, default: ""
      t.string  :first_name,    null: false, default: ""
      t.string  :post_code,     null: false, default: ""
      t.text    :address,       null: false, default: ""
      t.timestamps
    end
  end
end
