class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ['USERNAME'], password: ['PASSWORD']

  def show
  end
end
