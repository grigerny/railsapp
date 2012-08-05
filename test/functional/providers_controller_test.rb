require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  setup do
    @provider = providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider" do
    assert_difference('Provider.count') do
      post :create, provider: { city: @provider.city, insured: @provider.insured, latitude: @provider.latitude, longitude: @provider.longitude, name: @provider.name, phone: @provider.phone, service_id: @provider.service_id, state: @provider.state, street: @provider.street, website: @provider.website, zip: @provider.zip }
    end

    assert_redirected_to provider_path(assigns(:provider))
  end

  test "should show provider" do
    get :show, id: @provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider
    assert_response :success
  end

  test "should update provider" do
    put :update, id: @provider, provider: { city: @provider.city, insured: @provider.insured, latitude: @provider.latitude, longitude: @provider.longitude, name: @provider.name, phone: @provider.phone, service_id: @provider.service_id, state: @provider.state, street: @provider.street, website: @provider.website, zip: @provider.zip }
    assert_redirected_to provider_path(assigns(:provider))
  end

  test "should destroy provider" do
    assert_difference('Provider.count', -1) do
      delete :destroy, id: @provider
    end

    assert_redirected_to providers_path
  end
end
