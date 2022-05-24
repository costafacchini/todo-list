require 'rails_helper'

RSpec.describe 'todos/show', type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      name: 'Lista de compras',
      description: 'Detalhes da lista'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Lista de compras/)
    expect(rendered).to match(/Detalhes da lista/)
  end
end
