require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get borrowings_create_url
    assert_response :success
  end

  test "should get update" do
    get borrowings_update_url
    assert_response :success
  end
end
