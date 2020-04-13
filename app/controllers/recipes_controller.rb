class RecipesController < ApplicationController


  def index
     
    if params[:category_id]
        @recipes = Category.find(params[:category_id])
    else
  
        @recipes = Recipe.search(params[:search]).ordered_by_name
    end
  end
      
  
  
  def new
      #unnested
      @recipe=Recipe.new
      @category=Category.new
      @recipe.category = @category
      @recipe.build_category #belongs_to
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
    @recipe = current_user.recipes.find_by(id: params[:id])
    if @recipe 
      render 'edit'
    else
      redirect_to recipes_path
    end
end 

  def update
    @recipe = current_user.recipes.find(params[:id])
    #  binding.pry
     if @recipe.update(recipe_params) 
    # binding.pry
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
         @recipe = Recipe.find_by_id(params[:id])
      if @recipe.user == current_user
         @recipe.destroy
      end
         redirect_to recipes_path
  end

  private

  def recipe_params
      params.require(:recipe).permit(:description, :instructions, :ingredients, :name, :search, :category_id , :user_id,  category_attributes:[:name])
  end

end
