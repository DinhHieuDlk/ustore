class Admin::DashboardController < Admin::ApplicationController
	authorize_resource :class => :controller
  def index
  end
end
