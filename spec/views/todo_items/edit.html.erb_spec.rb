require 'rails_helper'

RSpec.describe 'todo_items/edit', type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      name: 'Lista de compras',
      description: 'Detalhes da lista'
    ))
    @todo_item = assign(:todo_item, TodoItem.create!(
      description: 'Cebola',
      todo_id: @todo.id
    ))
  end

  it 'renders the edit todo form' do
    render

    assert_select 'form[action=?][method=?]', todo_todo_item_path(@todo, @todo_item), 'post' do

      assert_select 'input[name=?]', 'todo_item[description]'

      assert_select 'input[name=?]', 'todo_item[done]'
    end
  end
end
