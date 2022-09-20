require 'rails_helper'

RSpec.describe "As a visitor, when I visit a ingredients index page" do
  before :each do
    @chef_1 = Chef.create!(name: "Sandy")
    
    @dish_1 = Dish.create!(name: "Cheese Pizza", description: "A classic plain cheese pizza, add toppings and bake until ready", chef_id:@chef_1.id)

    
    @ingredient_1 = @dish_1.ingredients.create!(name: "Pizza Dough", calorie_count: 300)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Red Sauce", calorie_count: 200)
    @ingredient_3 = @dish_1.ingredients.create!(name: "Cheese", calorie_count: 400)

  end

  it "shows a unique list of names of all the ingredients used by the chef.(US#3)" do
    visit ingredients_path
    
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
  end
end