require 'rails_helper'

RSpec.describe 'todos/show', type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      name: 'Lista de compras',
      description: 'Detalhes da lista'
    ))
    assign(:todo_items, [
      TodoItem.create!(
        description: 'Cebola',
        todo_id: @todo.id
      ),
      TodoItem.create!(
        description: 'Batata',
        todo_id: @todo.id
      )
    ])
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Lista de compras/)
    expect(rendered).to match(/Detalhes da lista/)
    expect(rendered).to match(/Cebola/)
    expect(rendered).to match(/Batata/)
  end
end
