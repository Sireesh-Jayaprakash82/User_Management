require 'C:\Users\Sireesh.jayaprakash\OneDrive - Happiest Minds Technologies Limited\Desktop\Project\user_management\test\test_helper.rb'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:three)
    @user = users(:five)
  end

  def authenticated_header
    token = JsonWebToken.encode(user_id: @user.id)
    {
      'Authorization': "Bearer #{token}"
    }
  end

  test "should get index" do
    get roles_url
    assert_response :success
  end

  test "should create role" do
    assert_includes(Role.all, @role) do
      post roles_url, params: { role: { role_name: @role.role_name } }
    end
  end

  test "should show role" do
    get role_url(@role), headers: authenticated_header
    assert_response :success
  end


  test "should destroy role" do
    assert_difference("Role.count", -1) do
      delete role_url(@role), headers: authenticated_header
    end
  end

end
