require 'test_helper'

class UserPredictionsControllerTest < ActionController::TestCase
  setup do
    @user_prediction = user_predictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_predictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_prediction" do
    assert_difference('UserPrediction.count') do
      post :create, user_prediction: { game_id: @user_prediction.game_id, home_team_goals: @user_prediction.home_team_goals, points: @user_prediction.points, user_id: @user_prediction.user_id, visitor_team_goals: @user_prediction.visitor_team_goals, winner: @user_prediction.winner }
    end

    assert_redirected_to user_prediction_path(assigns(:user_prediction))
  end

  test "should show user_prediction" do
    get :show, id: @user_prediction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_prediction
    assert_response :success
  end

  test "should update user_prediction" do
    patch :update, id: @user_prediction, user_prediction: { game_id: @user_prediction.game_id, home_team_goals: @user_prediction.home_team_goals, points: @user_prediction.points, user_id: @user_prediction.user_id, visitor_team_goals: @user_prediction.visitor_team_goals, winner: @user_prediction.winner }
    assert_redirected_to user_prediction_path(assigns(:user_prediction))
  end

  test "should destroy user_prediction" do
    assert_difference('UserPrediction.count', -1) do
      delete :destroy, id: @user_prediction
    end

    assert_redirected_to user_predictions_path
  end
end
