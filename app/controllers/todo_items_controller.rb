class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: %i[ edit update ]

  def create
    @todo = Todo.find(params[:todo_id])
    @todo_item = @todo.todo_items.create(todo_item_params)
    redirect_to todo_path(@todo)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.turbo_stream
        format.html { redirect_to todo_todo_item_url(@todo_item), notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.turbo_stream
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
      @todo = @todo_item.todo
    end

    def todo_item_params
      params.require(:todo_item).permit(:description, :done)
    end
end
