require "test_helper"

class BindusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bindu = bindus(:one)
  end

  test "should get index" do
    get bindus_url
    assert_response :success
  end

  test "should get new" do
    get new_bindu_url
    assert_response :success
  end

  test "should create bindu" do
    assert_difference('Bindu.count') do
      post bindus_url, params: { bindu: { menu: @bindu.menu, name: @bindu.name } }
    end

    assert_redirected_to bindu_url(Bindu.last)
  end

  test "should show bindu" do
    get bindu_url(@bindu)
    assert_response :success
  end

  test "should get edit" do
    get edit_bindu_url(@bindu)
    assert_response :success
  end

  test "should update bindu" do
    patch bindu_url(@bindu), params: { bindu: { menu: @bindu.menu, name: @bindu.name } }
    assert_redirected_to bindu_url(@bindu)
  end

  test "should destroy bindu" do
    assert_difference('Bindu.count', -1) do
      delete bindu_url(@bindu)
    end

    assert_redirected_to bindus_url
  end
end
