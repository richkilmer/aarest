class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_service
  
  def current_service
   @current_service ||= find_service_by_api_token
  end

  def require_operations
    current_service.operations?
  end
  
  private

  def require_service
    return false unless require_current_service
  end

  def find_service_by_api_token
    api_key = (request.env["HTTP_X_AAREST_SERVICE_KEY"] || params[:service_key])
    Service.find_by_key(api_key) if api_key
  end

  def require_current_service
   unless current_service
     respond_to do |format|
       format.html do
         head 401
       end
       four_oh_one = lambda{head 401}
       [:xml, :json].each do |f|
         format.send(f, &four_oh_one)
       end
     end
     return false
   end
  end


end
