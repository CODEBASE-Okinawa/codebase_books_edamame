class AddStatusToLending < ActiveRecord::Migration[7.0]
  def change
    add_column :lendings, :statuses, :boolean
  end
end
