require 'C:\Users\Sireesh.jayaprakash\OneDrive - Happiest Minds Technologies Limited\Desktop\Project\user_management\test\test_helper.rb'
class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should post login" do
    post login_path, params: { email: "123@gmail.com" ,password:"123" }, as: :json
    assert_response :success
  end
end