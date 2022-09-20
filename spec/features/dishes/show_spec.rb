require 'rails_helper'

RSpec.describe "As a visitor When I visit a dish's show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Sandy")
    @dish_1 = Dish.create!(name: "Cheese Pizza", description: "A classic plain cheese pizza, add toppings and bake until ready", chef_id:@chef_1.id)
    @ingredient1 = Ingredient.create!(name: "Pizza Dough", dish_id: @dish_1)
    @ingredient2 = Ingredient.create!(name: "Red Sauce", dish_id: @dish_1)
    @ingredient3 = Ingredient.create!(name: "Cheese", dish_id: @dish_1)

  end

  it "it shows the dish's name and description" do
    visit dish_path(@dish) #check routes
    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
  end

  it "shows a list of ingredients for the dish and the chefs name" do
    visit dish_path(@dish) #check routes
    expect(page).to have_content(@dish.chef.name)
    expect(page).to have_content([@ingredient1, @ingredient2, @ingredient3])
  end
end