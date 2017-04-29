require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipes_url
    assert_response :success
  end

########## CRUD #####################
test "should create recipe" do
  assert_difference('Recipe.count') do
    post recipes_url, params: { recipe: { name: 'Recipe one', description: 'This is description one' } }
  end

  assert_redirected_to recipes_path
end


test "should destroy recipe" do
  recipe = recipes(:one)
  assert_difference('Recipe.count', -1) do
    delete recipe_url(recipe)
  end

  assert_redirected_to recipes_path
end

test "should update recipe" do
  recipe = recipes(:one)

  patch recipe_url(recipe), params: { recipe: { name: "nameupdated",description: "descriptionupdated" } }

  assert_redirected_to recipes_path
  recipe.reload
  assert_equal "nameupdated", recipe.name
  assert_equal "descriptionupdated", recipe.description
end
########## CRUD #####################
end
