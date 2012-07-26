module ApplicationHelper

  def line_break(string)
    string.gsub("\n", '<br>')
  end

  def random_recipes
    if Recipe.all.count > 0


      tmp_recipe = Recipe.first(:order => "RANDOM()")
      link_to(tmp_recipe.name,tmp_recipe)

    end


  end

end
