require "test_helper"

class RecurrencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recurrences_new_url
    assert_response :success
  end

  test "should get create" do
    get recurrences_create_url
    assert_response :success
  end
end
