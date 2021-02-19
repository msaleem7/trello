class AddDetailsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :description, :string
    add_column :tasks, :status, :boolean
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
