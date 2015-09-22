require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get article:belongs_to" do
    get :article:belongs_to
    assert_response :success
  end

end
