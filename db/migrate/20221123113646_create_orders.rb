class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount, null: false
      t.timestamp :completed_at
      t.references :merchant, foreign_key: true
      t.references :shopper, foreign_key: true
      t.timestamps
    end
  end
end
