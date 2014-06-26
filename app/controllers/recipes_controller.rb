class RecipesController < ApplicationController

  def index
    @title = "Recipes"
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id]) 
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(params[:recipe])
    flash[:success] = "Recipe successfully created!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/recipes/#{@recipe.id}"
  end 

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:danger] = "That recipe is gone. POOF!"
    redirect_to "/index"
  end

end
