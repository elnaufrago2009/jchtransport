class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	#protect_from_forgery with: :exception
	#protect_from_forgery

  	before_filter :authenticate_admin!

	def after_sign_in_path_for(user)
		root_path
	end

	def after_sign_out_path_for(user)
		"/"
	end
end
