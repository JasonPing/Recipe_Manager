require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

#################### Test on add form ################
  test "should not save recipe without name" do
      recipe = Recipe.new
      assert_not recipe.save
  end

  test "recipe name should not longer than 100" do
      recipe = Recipe.new(name: 'a'*101)
      assert_not recipe.save
  end

  test "recipe name should be less than 100" do
      recipe = Recipe.new(name: 'a'*50)
      assert recipe.save
  end

  test "recipe description can be empty" do
      recipe = Recipe.new(name: 'a'*50, description:'')
      assert recipe.save
  end

  test "recipe description can be not longer than 500" do
     recipe = Recipe.new(name: 'a'*50, description:'a'*501)
     assert_not recipe.save
  end

  #################### Test on add form ################



end
