require 'rails_helper'

RSpec.describe TodoItemsController, type: :routing do
  describe 'routing' do
    it 'does not route to #index' do
      expect(get: '/todos/1/todo_items').not_to route_to('todo_items#index')
    end

    it 'does not route to #new' do
      expect(get: '/todos/1/todo_items/new').not_to route_to('todo_items#new')
    end

    it 'does not route to #show' do
      expect(get: '/todos/1/todo_items/1').not_to route_to('todo_items#show', id: '1')
    end

    it 'does not route to #edit' do
      expect(get: '/todos/1/todo_items/1/edit').not_to route_to('todo_items#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/todos/1/todo_items').to route_to('todo_items#create', todo_id: '1')
    end

    it 'does not route to #update via PUT' do
      expect(put: '/todos/1/todo_items/1').not_to route_to('todo_items#update', id: '1')
    end

    it 'does not route to #update via PATCH' do
      expect(patch: '/todos/1/todo_items/1').not_to route_to('todo_items#update', id: '1')
    end

    it 'does not route to #destroy' do
      expect(delete: '/todos/1/todo_items/1').not_to route_to('todo_items#destroy', id: '1')
    end
  end
end
