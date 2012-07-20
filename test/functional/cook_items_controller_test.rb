require 'test_helper'

class CookItemsControllerTest < ActionController::TestCase
  setup do
    @cook_item = cook_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cook_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cook_item" do
    assert_difference('CookItem.count') do
      post :create, cook_item: { ingredient_id: @cook_item.ingredient_id, quantity: @cook_item.quantity, recipe_id: @cook_item.recipe_id, unit: @cook_item.unit }
    end

    assert_redirected_to cook_item_path(assigns(:cook_item))
  end

  test "should show cook_item" do
    get :show, id: @cook_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cook_item
    assert_response :success
  end

  test "should update cook_item" do
    put :update, id: @cook_item, cook_item: { ingredient_id: @cook_item.ingredient_id, quantity: @cook_item.quantity, recipe_id: @cook_item.recipe_id, unit: @cook_item.unit }
    assert_redirected_to cook_item_path(assigns(:cook_item))
  end

  test "should destroy cook_item" do
    assert_difference('CookItem.count', -1) do
      delete :destroy, id: @cook_item
    end

    assert_redirected_to cook_items_path
  end
end
