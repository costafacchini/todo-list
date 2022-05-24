require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end
end
