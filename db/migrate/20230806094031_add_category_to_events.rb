class AddCategoryToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :category, :integer
  end
end
