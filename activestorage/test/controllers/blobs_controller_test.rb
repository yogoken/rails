require "test_helper"
require "database/setup"

class ActiveStorage::BlobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blob = create_image_blob filename: "racecar.jpg"
  end

  test "showing blob utilizes browser caching" do
    get rails_blob_url(@blob)

    assert_redirected_to(/racecar.jpg/)
    assert_equal "max-age=300, private", @response.headers["Cache-Control"]
  end
end
