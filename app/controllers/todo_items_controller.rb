class TodoItemsController < ApplicationController
  def create
    @todo = Todo.find(params[:todo_id])
    @todo_item = @todo.todo_items.create(todo_item_params)
    redirect_to todo_path(@todo)
  end

  private
    def todo_item_params
      params.require(:todo_item).permit(:description)
    end
end
