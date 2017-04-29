class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 100}
  validates :description, length: {maximum: 500}
end
