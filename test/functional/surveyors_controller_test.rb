require 'test_helper'

class SurveyorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
