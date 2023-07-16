class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :name
      t.string :password
      t.boolean :admin , default: false, null: false

      t.timestamps
    end
  end
end
