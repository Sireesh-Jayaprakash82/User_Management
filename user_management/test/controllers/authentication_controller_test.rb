require 'C:\Users\Sireesh.jayaprakash\OneDrive - Happiest Minds Technologies Limited\Desktop\Project\user_management\test\test_helper.rb'
class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should post login" do
    post login_url, params: { email: "123@gmail.com" , password:"password" }, as: :json
    assert_response :success
  end
end