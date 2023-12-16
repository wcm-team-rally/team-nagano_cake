require "test_helper"

class Public::CarItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_car_items_index_url
    assert_response :success
  end

  test "should get update" do
    get public_car_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_car_items_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get public_car_items_destroy_all_url
    assert_response :success
  end

  test "should get create" do
    get public_car_items_create_url
    assert_response :success
  end
end
