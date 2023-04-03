require 'C:\Users\Sireesh.jayaprakash\OneDrive - Happiest Minds Technologies Limited\Desktop\Project\user_management\test\test_helper.rb'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:five)
    @role = roles(:three)
  end

  def authenticated_header
    token = JsonWebToken.encode(user_id: @user.id)
    {
      'Authorization': "Bearer #{token}"
    }
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should create user" do
    assert_includes(User.all, @user) do
      post users_url, params: { user: { full_name: @user.full_name, email: @user.email, username: @user.username, password: @user.password } }
    end
  end

  test "should show user" do
    get user_url(@user), headers: authenticated_header
    assert_response :success
  end

  test "should edit user" do
    patch user_url(@user.id), params: { user: { full_name: @user.full_name, email: @user.email, username: @user.username, password: @user.password } }, headers: authenticated_header
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user.id), headers: authenticated_header
    end
  end

  test "should assign role to a user" do
    assert_difference("@user.roles.count", 1) do
      post user_role_url(@user.id, @role.id), headers: authenticated_header
    end
  end

  test "remove role of a user" do
    assert_not_includes(@user.roles, @role) do
      delete user_de_role_url(@user.id, @role.id), headers: authenticated_header
    end
  end

end
