require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  #################### Test on add form ################
    test "should not save ingredient without name" do
        ingredient = Ingredient.new
        assert_not ingredient.save
    end

    test "ingredient name should not longer than 100" do
        ingredient = Ingredient.new(name: 'a'*101)
        assert_not ingredient.save
    end

    test "ingredient name should be less than 100" do
        ingredient = Ingredient.new(name: 'a'*50)
        assert ingredient.save
    end

    test "ingredient description can be empty" do
        ingredient = Ingredient.new(name: 'a'*50, description:'')
        assert ingredient.save
    end

    test "ingredient description can be not longer than 500" do
       ingredient = Ingredient.new(name: 'a'*50, description:'a'*501)
       assert_not ingredient.save
    end

    #################### Test on add form ################
end
