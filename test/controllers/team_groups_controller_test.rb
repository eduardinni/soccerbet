require 'test_helper'

class TeamGroupsControllerTest < ActionController::TestCase
  setup do
    @team_group = team_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_group" do
    assert_difference('TeamGroup.count') do
      post :create, team_group: { name: @team_group.name }
    end

    assert_redirected_to team_group_path(assigns(:team_group))
  end

  test "should show team_group" do
    get :show, id: @team_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_group
    assert_response :success
  end

  test "should update team_group" do
    patch :update, id: @team_group, team_group: { name: @team_group.name }
    assert_redirected_to team_group_path(assigns(:team_group))
  end

  test "should destroy team_group" do
    assert_difference('TeamGroup.count', -1) do
      delete :destroy, id: @team_group
    end

    assert_redirected_to team_groups_path
  end
end
