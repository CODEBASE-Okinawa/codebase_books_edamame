class ChangeDatatypebookOflendings < ActiveRecord::Migration[7.0]
  def change
    change_column :lending, :book, :integer
  end
end
