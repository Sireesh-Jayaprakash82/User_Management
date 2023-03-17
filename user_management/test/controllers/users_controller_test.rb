require 'C:\Users\Sireesh.jayaprakash\OneDrive - Happiest Minds Technologies Limited\Desktop\Project\user_management\test\test_helper.rb'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @role = roles(:two)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { full_name: @user.full_name, email: @user.email, username: @user.username, password: @user.password, role: @role.role_name } }
    end
  end

  test "should show user" do
    get users_url(@user)
    assert_response :success
  end

  test "should edit user" do
    patch users_url(@user), params: { user: { full_name: @user.full_name, email: @user.email, username: @user.username, password: @user.password, role: @role.role_name } }
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete users_url(@user)
    end
  end

end
