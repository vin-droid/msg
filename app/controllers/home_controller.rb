class HomeController < ApplicationController

	before_action :authenticate_admin!

  def index
  	redirect dashboard_path
  end
end
