# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @task = Task.all
  end
end
