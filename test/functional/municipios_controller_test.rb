require 'test_helper'

class MunicipiosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:municipios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create municipio" do
    assert_difference('Municipio.count') do
      post :create, :municipio => { }
    end

    assert_redirected_to municipio_path(assigns(:municipio))
  end

  test "should show municipio" do
    get :show, :id => municipios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => municipios(:one).to_param
    assert_response :success
  end

  test "should update municipio" do
    put :update, :id => municipios(:one).to_param, :municipio => { }
    assert_redirected_to municipio_path(assigns(:municipio))
  end

  test "should destroy municipio" do
    assert_difference('Municipio.count', -1) do
      delete :destroy, :id => municipios(:one).to_param
    end

    assert_redirected_to municipios_path
  end
end
