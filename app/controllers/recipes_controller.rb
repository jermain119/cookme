class RecipesController < ApplicationController


  def index
     
     if params[:category_id]
      @recipes = Category.find(params[:category_id])
      else
  
        @recipes = Recipe.search(params[:search]).ordered_by_name
      end
    end
      
  
  
  def new
     #check if it's nested & it's a proper id
     if params[:category_id] && category = Category.find_by_id(params[:category_id])
      #nested route
      @recipe = category.recipes.build #has_many
    else
      #unnested
      @recipe=Recipe.new
      @recipe.build_category #belongs_to
    end
  end

  def create
  @recipe = Recipe.new(recipe_params)
  
    if @recipe.save
    redirect_to @recipe
    else
    render 'new'
    end

  end
 
  def show
    @recipe = Recipe.find_by_id(params[:id])

  end
   
  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
      @recipe = Recipe.find_by_id(params[:id])
      
      @recipe.destroy
     
      redirect_to recipes_path
  end

  private

  def recipe_params
      params.require(:recipe).permit(:description, :instructions, :ingredients, :name, :search, :category_id , :user_id,  category_attributes:[:name])
  end

end
