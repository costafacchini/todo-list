require 'rails_helper'

RSpec.describe '/todos', type: :request do
  let(:valid_attributes) {
    { name: 'Lista do Mercado', description: 'Lista de compras do mercado' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      Todo.create! valid_attributes
      get todos_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      todo = Todo.create! valid_attributes
      get todo_url(todo)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_todo_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      todo = Todo.create! valid_attributes
      get edit_todo_url(todo)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Todo' do
        expect {
          post todos_url, params: { todo: valid_attributes }
        }.to change(Todo, :count).by(1)
      end

      it 'redirects to the created todo' do
        post todos_url, params: { todo: valid_attributes }
        expect(response).to redirect_to(todo_url(Todo.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Todo' do
        expect {
          post todos_url, params: { todo: invalid_attributes }
        }.to change(Todo, :count).by(0)
      end

      it 'renders a error response' do
        post todos_url, params: { todo: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { name: 'Lista de Compras', description: 'Lita de itens para comprar' }
      }

      it 'updates the requested todo' do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: new_attributes }
        todo.reload
        expect(todo.name).to eq('Lista de Compras')
        expect(todo.description).to eq('Lita de itens para comprar')
      end

      it 'redirects to the todo' do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: new_attributes }
        todo.reload
        expect(response).to redirect_to(todo_url(todo))
      end
    end

    context 'with invalid parameters' do
      it 'renders a error response' do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested todo' do
      todo = Todo.create! valid_attributes
      expect {
        delete todo_url(todo)
      }.to change(Todo, :count).by(-1)
    end

    it 'redirects to the todos list' do
      todo = Todo.create! valid_attributes
      delete todo_url(todo)
      expect(response).to redirect_to(todos_url)
    end
  end
end
