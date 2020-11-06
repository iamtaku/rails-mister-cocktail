class AddImgToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :img, :string
  end
end
