class CreateLendings < ActiveRecord::Migration[7.0]
  def change
    create_table :lendings do |t|
      t.string :user_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
