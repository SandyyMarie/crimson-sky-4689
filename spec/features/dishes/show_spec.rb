require 'rails_helper'

RSpec.describe "As a visitor When I visit a dishes show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Sandy")
    @dish_1 = Dish.create!(name: "Cheese Pizza", description: "A classic plain cheese pizza, add toppings and bake until ready", chef_id:@chef_1.id)
    @ingredient_1 = @dish_1.ingredients.create!(name: "Pizza Dough")
    @ingredient_2 = @dish_1.ingredients.create!(name: "Red Sauce")
    @ingredient_3 = @dish_1.ingredients.create!(name: "Cheese")


  end

  it "it shows the dish's name and description" do
    visit dish_path(@dish_1) #check routes
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end

  it "shows a list of ingredients for the dish and the chefs name" do
    visit dish_path(@dish_1) #check routes
    expect(page).to have_content(@dish_1.chef.name)
    expect(page).to have_content([@ingredient_1, @ingredient_2, @ingredient_3])
  end
end