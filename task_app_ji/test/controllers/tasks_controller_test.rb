# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'should get new task page' do
    get new_path
    assert_response :success
  end
end
