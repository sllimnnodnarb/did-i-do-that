class AddCompletedToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :completed, :boolean
  end
end
