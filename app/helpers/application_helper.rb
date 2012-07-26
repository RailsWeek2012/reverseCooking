module ApplicationHelper

  def line_break(string)
    string.gsub("\n", '<br>')
  end

  def random_recipes
    unless Recipe.all.count == 0

      all_recipes = Recipe.all
      tmp_recipe = all_recipes.sample(1).first


      link_to(tmp_recipe.name,tmp_recipe)

    end


  end

end
