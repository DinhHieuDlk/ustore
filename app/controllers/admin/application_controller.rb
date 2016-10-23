class Admin::ApplicationController < ActionController::Base
rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
	protect_from_forgery with: :exception
	layout "admin"
end