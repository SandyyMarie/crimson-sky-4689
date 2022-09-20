class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredients

  def calories
    self.ingredients.sum(:calorie_count)
  end
end