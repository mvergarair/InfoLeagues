class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  layout :layout_by_resource

  def download_attachment
      redirect_to params[:model].titleize.constantize.find(params[:id]).send(params[:attribute]).expiring_url(10)
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

  

  # before_filter  :cors_preflight_check
  # after_filter :cors_set_access_control_headers

# # For all responses in this controller, return the CORS access control headers.

# def cors_set_access_control_headers
#   headers['Access-Control-Allow-Origin'] = '*'
#   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#   headers['Access-Control-Allow-Headers'] = '*'
#   headers['Access-Control-Max-Age'] = "1728000"
# end

# # If this is a preflight OPTIONS request, then short-circuit the
# # request, return only the necessary headers and return an empty
# # text/plain.

# def cors_preflight_check
#   if request.method == :options
#     headers['Access-Control-Allow-Origin'] = '*'
# 	headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
# 	headers['Access-Control-Request-Method'] = '*'
# 	headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
#     render :text => '', :content_type => 'text/plain'
#   end
# end
  
end
