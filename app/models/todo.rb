class Todo < ApplicationRecord
  has_many :todo_items,
           dependent: :restrict_with_error

  validates :name,
            presence: true
end
