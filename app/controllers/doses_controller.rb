class DosesController < ApplicationController
  # before_action :set_cocktail, only: %i[new create]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # doses = []
    dose = dose_params
    # doses << dose
    @dose = Dose.new(dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to root_path
    else
      render :new
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
