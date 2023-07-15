class CreateLendings < ActiveRecord::Migration[7.0]
  def change
    create_table :lendings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :book_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
