require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post :create, log: { cron_time: @log.cron_time, file_size: @log.file_size, filepath: @log.filepath, operate_type: @log.operate_type, reserve_dates: @log.reserve_dates, title: @log.title }
    end

    assert_redirected_to log_path(assigns(:log))
  end

  test "should show log" do
    get :show, id: @log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log
    assert_response :success
  end

  test "should update log" do
    put :update, id: @log, log: { cron_time: @log.cron_time, file_size: @log.file_size, filepath: @log.filepath, operate_type: @log.operate_type, reserve_dates: @log.reserve_dates, title: @log.title }
    assert_redirected_to log_path(assigns(:log))
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete :destroy, id: @log
    end

    assert_redirected_to logs_path
  end
end
