class RecipesController < ApplicationController
  before_filter :require_login! , except: [:index, :show]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.search(params[:search_re])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comment.recipe = @recipe

    session[:return_to] = request.env["REQUEST_URI"]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    ingredients = params[:ingredients]


    if ingredients.blank?
      #Todo: throw error: no ingredients are given
    else
      @recipe.ingredient_ids = ingredients.collect { |key, value| key }
    end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    ingredients = params[:ingredients]
    unless ingredients.blank?
      @recipe.ingredient_ids = ingredients.collect {|key, value| key}
    end

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def vote
    @recipe = Recipe.find(params[:recipe_id])

    if @recipe.vote_count == nil
      @recipe.vote_count = 1
      @recipe.vote_sum = params[:voting].to_i
    else
      @recipe.vote_count += 1
      @recipe.vote_sum += params[:voting].to_i
    end


    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Thanks for voting' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def require_login!
    unless user_signed_in?
      redirect_to login_path,
                  alert: "Bitte melden Sie sich zuerst an."
    end
  end

end
