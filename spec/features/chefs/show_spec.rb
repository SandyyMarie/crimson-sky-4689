require 'rails_helper'

RSpec.describe "As a visitor, when I visit a chef's show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Sandy")
    
    @dish_1 = Dish.create!(name: "Cheese Pizza", description: "A classic plain cheese pizza, add toppings and bake until ready", chef_id:@chef_1.id)
    
    @ingredient_1 = @dish_1.ingredients.create!(name: "Pizza Dough", calorie_count: 300)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Red Sauce", calorie_count: 200)
    @ingredient_3 = @dish_1.ingredients.create!(name: "Cheese", calorie_count: 400)
  end

  it 'shows the name of the chef with a link to the ingredients#index page (US#3)' do
    visit chef_path(@chef_1)

    expect(page).to have_content(@chef_1.name)

    click_link "Ingredients Used"
    expect(current_path).to eq(ingredients_path)
  end

#   As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)
  # it 'shows the three most popular ingredients that the chef uses in their dishes' do
  #   visit chef_path(@chef_1) 

  #   #having trouble figuring out how to declare ingredients to be individuals as well, would I update dishes to also have ingredient ids?
  # end

end