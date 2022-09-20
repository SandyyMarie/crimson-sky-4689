require 'rails_helper'

RSpec.describe "As a visitor, when I visit a chef's show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Sandy")
    
    @dish_1 = Dish.create!(name: "Cheese Pizza", description: "A classic plain cheese pizza, add toppings and bake until ready", chef_id:@chef_1.id)
    
    @ingredient_1 = @dish_1.ingredients.create!(name: "Pizza Dough", calorie_count: 300)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Red Sauce", calorie_count: 200)
    @ingredient_3 = @dish_1.ingredients.create!(name: "Cheese", calorie_count: 400)
  end

  # I see the name of that chef
  # And I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredient index page
  # and I can see a unique list of names of all the ingredients that this chef uses.
  it 'shows the name of the chef with a link to the ingredients#index page (US#3)' do
    visit chef_path(@chef_1)

    expect(page).to have_content(@chef_1.name)

    click_link "Ingredients Used"
    expect(current_path).to eq(ingredients_path)
  end


end