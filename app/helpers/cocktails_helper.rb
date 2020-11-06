module CocktailsHelper

  def cocktail_background(cocktail)
    if cocktail.photo.attached?
      cl_image_path(cocktail.photo.key)
    else
      ''
    end
  end
end
