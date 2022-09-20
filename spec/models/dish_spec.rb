require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredients}
  end

  describe 'model testing' do
    before :each do
      @chef_1 = Chef.create!(name: "Sandy")

      @dish_1 = Dish.create!(name: "Cheese Pizza", description: "A classic plain cheese pizza, add toppings and bake until ready", chef_id:@chef_1.id)

      @ingredient_1 = @dish_1.ingredients.create!(name: "Pizza Dough", calorie_count: 300)
      @ingredient_2 = @dish_1.ingredients.create!(name: "Red Sauce", calorie_count: 200)
      @ingredient_3 = @dish_1.ingredients.create!(name: "Cheese", calorie_count: 400)
    end

    it 'can return the total amount of calories for a given dish' do
      expect(@dish_1.calories).to eq(900)
    end
  end
end