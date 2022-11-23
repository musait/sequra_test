class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.decimal :amount, null: false
      t.timestamp :completed_at
      t.references :merchant, foreign_key: true, type: :uuid
      t.references :shopper, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
