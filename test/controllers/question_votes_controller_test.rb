require 'test_helper'

class QuestionVotesControllerTest < ActionController::TestCase
  test "should get plus" do
    get :plus
    assert_response :success
  end

  test "should get minus" do
    get :minus
    assert_response :success
  end

end
