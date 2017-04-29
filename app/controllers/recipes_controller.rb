class RecipesController < ApplicationController
  before_action:find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes =Recipe.all.order("created_at ASC")
    # @ingredient = Ingredient.where(["recipe_id = ?", 18])
    @ingredient = Ingredient.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :description)
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end
