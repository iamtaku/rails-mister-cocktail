class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  def new
    @dose = Dose.new
    @ingredients = Ingredient.where.not(id: @cocktail.ingredients)
  end

  def create
    @dose = Dose.new(set_dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.where.not(id: @cocktail.ingredients)
      render :new

    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
