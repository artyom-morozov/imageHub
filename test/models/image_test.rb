require "test_helper"

class ImageTest < ActiveSupport::TestCase
  setup do
    @image = image(:one)
  end

  test "should get index" do
    get images_url
    assert_response :success
  end

  test "should show image" do
    get images_url(@image)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_url(@image)
    assert_response :success
  end

  test "should update image" do
    patch image_url(@image), params: {image: {title: @image.title, description: @image.description}}
    assert_redirect_to image_url(@image)
  end

  test "should destroy image" do
    assert_difference("Image.count", -1) do
      delete image_url(@image)
    end
    
    assert_redirect_to images_url
  end

end
