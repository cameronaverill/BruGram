class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: ['welcome#index']

  def check_user
  	if current_user != Photo.find(params[:id]).user
  		flash[:error] = "You must be logged in to access this section"
  		redirect_to photos_path
  	end
  end
  
end
