# frozen_string_literal: true

require 'test_helper'

class TasksTest < ActionDispatch::IntegrationTest
  test 'creates valid task' do
    get new_path

    assert_difference 'Task.count' do
      post tasks_path, params: { task: { name: 'Valid Task', description: 'Valid description' } }
    end

    follow_redirect!
    assert_template root_path
    assert_select 'div.alert.alert-success'
  end

  test 'creates invalid task' do
    get new_path

    assert_no_difference 'Task.count' do
      post tasks_path, params: { task: { name: '', description: '' } }
    end

    assert_template 'tasks/new'
    assert_select 'div.alert.alert-danger'
  end
end
