require 'test_helper'

class CutiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cuties_index_url
    assert_response :success
  end

  test "should get show" do
    get cuties_show_url
    assert_response :success
  end

  test "should get new" do
    get cuties_new_url
    assert_response :success
  end

  test "should get create" do
    get cuties_create_url
    assert_response :success
  end

  test "should get update" do
    get cuties_update_url
    assert_response :success
  end

  test "should get edit" do
    get cuties_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get cuties_destroy_url
    assert_response :success
  end

end
