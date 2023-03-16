class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Pomyślnie dodano kategorię"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Pomyślnie zmieniono kategorię"
      redirect_to admin_categories_path
      render action: :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
