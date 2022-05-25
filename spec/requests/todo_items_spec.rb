require 'rails_helper'

RSpec.describe '/todo_items', type: :request do
  let(:todo) { Todo.create!(name: 'Lista de mercado') }
  let(:valid_attributes) {
    { description: 'Cebola', todo_id: todo.id }
  }

  let(:invalid_attributes) {
    { description: nil }
  }

  describe 'GET /edit' do
    it 'render a successful response' do
      todo_item = TodoItem.create! valid_attributes
      get edit_todo_todo_item_url(todo, todo_item)
      expect(response).to be_successful
    end
  end

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

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { description: 'Tomate' }
      }

      it 'updates the requested todo item' do
        todo_item = TodoItem.create! valid_attributes
        patch todo_todo_item_url(todo, todo_item), params: { todo_item: new_attributes }
        todo_item.reload
        expect(todo_item.description).to eq('Tomate')
      end

      it 'redirects to the todo' do
        todo_item = TodoItem.create! valid_attributes
        patch todo_todo_item_url(todo, todo_item), params: { todo_item: new_attributes }
        todo_item.reload
        expect(response).to redirect_to(todo_todo_item_url(todo_item))
      end
    end

    context 'with invalid parameters' do
      it 'renders a error response' do
        todo_item = TodoItem.create! valid_attributes
        patch todo_todo_item_url(todo, todo_item), params: { todo_item: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end
