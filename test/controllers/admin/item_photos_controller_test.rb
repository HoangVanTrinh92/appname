require 'test_helper'

class Admin::ItemPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_item_photo = admin_item_photos(:one)
  end

  test "should get index" do
    get admin_item_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_item_photo_url
    assert_response :success
  end

  test "should create admin_item_photo" do
    assert_difference('Admin::ItemPhoto.count') do
      post admin_item_photos_url, params: { admin_item_photo: { item_id: @admin_item_photo.item_id, link: @admin_item_photo.link } }
    end

    assert_redirected_to admin_item_photo_url(Admin::ItemPhoto.last)
  end

  test "should show admin_item_photo" do
    get admin_item_photo_url(@admin_item_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_item_photo_url(@admin_item_photo)
    assert_response :success
  end

  test "should update admin_item_photo" do
    patch admin_item_photo_url(@admin_item_photo), params: { admin_item_photo: { item_id: @admin_item_photo.item_id, link: @admin_item_photo.link } }
    assert_redirected_to admin_item_photo_url(@admin_item_photo)
  end

  test "should destroy admin_item_photo" do
    assert_difference('Admin::ItemPhoto.count', -1) do
      delete admin_item_photo_url(@admin_item_photo)
    end

    assert_redirected_to admin_item_photos_url
  end
end
