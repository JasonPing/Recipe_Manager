class IngredientsController < ApplicationController
  before_action:find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients =Ingredient.all.order("created_at ASC")
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def add
    flash[:notice] = "Ingredient is added"
    @ingredient = Ingredient.find(params[:format])
    @ingredient.update_attribute(:recipe_id,params[:new_recipe_id])
    redirect_to ingredients_path(:request_recipe_id => params[:new_recipe_id])
  end

  helper_method :add


  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :description, :recipe_id)
    end

    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end


end
