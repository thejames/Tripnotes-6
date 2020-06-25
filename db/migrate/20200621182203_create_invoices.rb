class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.money :amount
      t.boolean :is_income
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
