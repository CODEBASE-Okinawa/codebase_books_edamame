class AddBookIdToLendings < ActiveRecord::Migration[7.0]
  def change
    add_column :lendings, :book, :string
  end
end
