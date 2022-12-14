class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.float :amount, default: 0.0
      t.references :merchant , foreign_key: true
      t.integer :week
      t.integer :year
      t.timestamps
    end
  end
end
