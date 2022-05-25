class TodoItem < ApplicationRecord
  belongs_to :todo

  validates :description,
            presence: true
end
