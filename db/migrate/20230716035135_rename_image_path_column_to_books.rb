class RenameImagePathColumnToBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :image_path, :image_name
  end
end
