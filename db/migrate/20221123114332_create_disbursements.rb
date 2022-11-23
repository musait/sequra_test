class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements, id: :uuid do |t|
      t.decimal :amount, default: 0.0
      t.references :merchant , foreign_key: true, type: :uuid
      t.integer :week
      t.integer :year
      t.timestamps
    end
  end
end
