require 'rails_helper'

RSpec.describe 'todos/new', type: :view do
  before(:each) do
    assign(:todo, Todo.new(
      name: 'Lista de compras',
      description: 'Detalhes da lista'
    ))
  end

  it 'renders new todo form' do
    render

    assert_select 'form[action=?][method=?]', todos_path, 'post' do

      assert_select 'input[name=?]', 'todo[name]'

      assert_select 'textarea[name=?]', 'todo[description]'
    end
  end
end
