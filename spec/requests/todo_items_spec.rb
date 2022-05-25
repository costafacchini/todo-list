require 'rails_helper'

RSpec.describe '/todo_items', type: :request do
  let(:todo) { Todo.create!(name: 'Lista de mercado') }
  let(:valid_attributes) {
    { description: 'Cebola', todo_id: todo.id }
  }

  let(:invalid_attributes) {
    { description: nil }
  }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new TodoItem' do
        expect {
          post "/todos/#{todo.id}/todo_items", params: { todo_item: valid_attributes }
        }.to change(TodoItem, :count).by(1)
      end

      it 'redirects to the todo' do
        post "/todos/#{todo.id}/todo_items", params: { todo_item: valid_attributes }
        expect(response).to redirect_to(todo_url(Todo.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new TodoItem' do
        expect {
          post "/todos/#{todo.id}/todo_items", params: { todo_item: invalid_attributes }
        }.to change(TodoItem, :count).by(0)
      end

      it 'renders a error response' do
        post "/todos/#{todo.id}/todo_items", params: { todo_item: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end
