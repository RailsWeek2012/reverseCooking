class CookItemsController < ApplicationController
  # GET /cook_items
  # GET /cook_items.json
  def index
    @cook_items = CookItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cook_items }
    end
  end

  # GET /cook_items/1
  # GET /cook_items/1.json
  def show
    @cook_item = CookItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cook_item }
    end
  end

  # GET /cook_items/new
  # GET /cook_items/new.json
  def new
    @cook_item = CookItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cook_item }
    end
  end

  # GET /cook_items/1/edit
  def edit
    @cook_item = CookItem.find(params[:id])
  end

  # POST /cook_items
  # POST /cook_items.json
  def create
    @cook_item = CookItem.new(params[:cook_item])

    respond_to do |format|
      if @cook_item.save
        format.html { redirect_to @cook_item, notice: 'Cook item was successfully created.' }
        format.json { render json: @cook_item, status: :created, location: @cook_item }
      else
        format.html { render action: "new" }
        format.json { render json: @cook_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cook_items/1
  # PUT /cook_items/1.json
  def update
    @cook_item = CookItem.find(params[:id])

    respond_to do |format|
      if @cook_item.update_attributes(params[:cook_item])
        format.html { redirect_to @cook_item, notice: 'Cook item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cook_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cook_items/1
  # DELETE /cook_items/1.json
  def destroy
    @cook_item = CookItem.find(params[:id])
    @cook_item.destroy

    respond_to do |format|
      format.html { redirect_to cook_items_url }
      format.json { head :no_content }
    end
  end
end
