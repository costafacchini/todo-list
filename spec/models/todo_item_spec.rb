require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe '#description' do
    it { is_expected.to validate_presence_of :description }
  end

  describe '#to-do' do
    it { is_expected.to belong_to(:todo).required }
  end
end
