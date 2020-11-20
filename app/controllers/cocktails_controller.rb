class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktails_doses = @cocktail.doses
    @cocktails_ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail_name = cocktail_params[:name].capitalize
    @cocktail = Cocktail.new(name: cocktail_name)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail.id)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
