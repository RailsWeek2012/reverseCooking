module RecipesHelper

  def get_voting recipe
    if recipe.vote_count == nil || recipe.vote_count == 0;
      score = 0
    else
      score = @recipe.vote_sum / @recipe.vote_count
    end
    score
  end


end
