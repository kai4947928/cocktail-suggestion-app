class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @q = Recipe.ransack(params[:q] || {})  # 空のparams[:q]に対応
    @recipes = @q.result.includes(:difficulty, :base_liquor, :ingredients)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @q = Recipe.ransack(params[:q] || {})
  end

  def new
    @recipe = Recipe.new
    @q = Recipe.ransack(params[:q] || {})
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @q = Recipe.ransack(params[:q] || {})

    if params[:recipe][:is_original] == "true"
      @recipe.parent_recipe_id = nil
    else
      @recipe.parent_recipe_id = params[:recipe][:parent_recipe_id]
    end

    if @recipe.save
      redirect_to @recipe, notice: "レシピが作成されました"
    else
      render :new, alert: "失敗しました"
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "更新されました"
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "削除されました"
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :alcohol_strength, :imag_url, :procedure, :official, :parent_recipe_id, :difficulty_id, :base_liquor_id, :user_id, :is_original)
    end
end
