require 'C:\Users\Sireesh.jayaprakash\OneDrive - Happiest Minds Technologies Limited\Desktop\Project\user_management\test\test_helper.rb'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
    @user = users(:two)
  end

  test "should get index" do
    get roles_url
    assert_response :success
  end

  test "should create role" do
    assert_difference("Role.count") do
      post roles_url, params: { role: { role_name: @role.role_name } }
    end
  end

  test "should show role" do
    get role_url(@role)
    assert_response :success
  end


  test "should destroy role" do
    assert_difference("Role.count", -1) do
      delete role_url(@role)
    end
  end

end
