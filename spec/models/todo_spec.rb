require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#to-do_items' do
    it { is_expected.to have_many(:todo_items).dependent(:restrict_with_error) }
  end
end
