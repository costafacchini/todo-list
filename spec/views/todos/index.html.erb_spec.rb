require 'rails_helper'

RSpec.describe 'todos/index', type: :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        name: 'Lista de compras',
        description: 'Detalhes da lista'
      ),
      Todo.create!(
        name: 'Lista de compras',
        description: 'Detalhes da lista'
      )
    ])
  end

  it 'renders a list of todos' do
    render
    assert_select 'span', text: 'Lista de compras'.to_s, count: 2
    assert_select 'span', text: 'Detalhes da lista'.to_s, count: 2
  end
end
