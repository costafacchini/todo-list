class AddDoneToTodoItems < ActiveRecord::Migration[7.0]
  def change
    add_column :todo_items, :done, :boolean, default: false
  end
end
