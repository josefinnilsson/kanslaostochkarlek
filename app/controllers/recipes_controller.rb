class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def new
        @recipe = Recipe.new
    end

    def index
        @recipes = Recipe.all.where(user_id: current_user)
    end

    def show
    end

    def update
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save!
            redirect_to :controller => 'recipes', :action => 'index'
        else
            flash[:notice] = "Recept skapat"
            render 'new'
        end
    end

    def destroy
        @recipe.destroy
        flash[:notice] = "Recept borttaget"
        redirect_to recipes_url
    end

    private
    def recipe_params
            params.require(:recipe).permit(:name, :portions, :description, :user_id)
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end