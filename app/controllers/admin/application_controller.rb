# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :check_permission

    def authenticate_admin
      if current_user.nil?
        redirect_to new_user_session_path and return
      end
      if not (current_user.admin? or current_user.info_adder?)
        flash[:alert] = 'No estas autorizado para realizar esta acción'
        redirect_to :root and return
      end
    end

    def check_permission
      permitted_controllers = [:leagues, :cups]
      permitted_actions = [:index ,:new, :show, :create, :edit, :update]

      if not (permitted_controllers.include?(controller_name.to_sym) or current_user.admin?)
        flash[:alert] = 'No estas autorizado para realizar esta acción'
        redirect_to admin_leagues_path  and return
      elsif not (permitted_actions.include?(action_name.to_sym) or current_user.admin?)
        flash[:alert] = 'No estas autorizado para realizar esta acción'
        redirect_to :admin_root  and return
      end

    end



    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
