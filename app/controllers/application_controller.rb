class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_day_params ,:check_aop_params, :counties_to_show, :switch_on, :check_price_params

  layout :layout_by_resource

  def download_attachment
      redirect_to params[:model].titleize.constantize.find(params[:id]).send(params[:attribute]).expiring_url(10)
  end

  def switch_on
      @ulfc_open = false
     if params[:uses_liga_fc] and params[:uses_liga_fc]!= '' 
      @ulfc_open = true
     end 
  end

  def check_day_params
    @days = {}
    @day_down = false
    Cup.days.each do |day|
      @days[day[0].to_sym] = false
    end
    if params[:search]
      if params[:day] and params[:day] != ''
        @day_down = true
        query_days = params[:day].split(',').map{ |day| day.to_sym}
        query_days.each do |day|
          @days[day] = true
        end
      end
    end
  end

  def check_aop_params
    @aops = {}
    @aop_down = false
    [5,6,7,8,9,10,11].each do |aop|
      @aops[aop] = false
    end
    if params[:amount_of_players] and params[:amount_of_players] != ''
      @aop_down = true
      params[:amount_of_players].split(',').each do |aop|
        @aops[aop.to_i] = true
      end
    end
  end

  def counties_to_show
    @counties = {}
    @counties_checked = {}
    @county_down = false
    County.all.each do |county|
      if params[:county] and params[:county].split(',').include? county.name
        @counties_checked[county.name] = true
        @county_down = true
      else
        @counties[county.name] = false;
      end
    end
  end

  def check_price_params
    @price_set = PriceOption.max_price
    @pp_down = false
    if params[:price] and params[:price] != ''
      @pp_down = true
      @price_set = params[:price].to_i

    end
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
