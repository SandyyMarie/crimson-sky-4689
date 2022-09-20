class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :calorie_count
  belongs_to :dish
end