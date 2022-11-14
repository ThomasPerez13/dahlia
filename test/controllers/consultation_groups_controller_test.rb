require "test_helper"

class ConsultationGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get consultation_groups_create_url
    assert_response :success
  end
end
