class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :company_name
      t.boolean :is_personal
      t.boolean :is_paid
      t.text :description
      t.string :routing
      t.string :tripit_link
      t.timestamp :start_date
      t.timestamp :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
