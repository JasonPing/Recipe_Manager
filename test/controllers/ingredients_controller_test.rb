require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredients_url
    assert_response :success
  end

########## CRUD #####################
test "should create ingredient" do
  assert_difference('Ingredient.count') do
    post ingredients_url, params: { ingredient: { name: 'ingredient one', description: 'This is description one' } }
  end

  assert_redirected_to ingredients_path
end


test "should destroy ingredient" do
  ingredient = ingredients(:one)
  assert_difference('Ingredient.count', -1) do
    delete ingredient_url(ingredient)
  end

  assert_redirected_to ingredients_path
end

test "should update ingredient" do
  ingredient = ingredients(:one)

  patch ingredient_url(ingredient), params: { ingredient: { name: "nameupdated",description: "descriptionupdated" } }

  assert_redirected_to ingredients_path
  ingredient.reload
  assert_equal "nameupdated", ingredient.name
  assert_equal "descriptionupdated", ingredient.description
end
########## CRUD #####################



end
