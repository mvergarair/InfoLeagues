module Admin
  class CupsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Cup.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Cup.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def new
        cup = Cup.new
        if params[:league]
            cup.league = League.find(params[:league])
        end
        render locals: {
            page: Administrate::Page::Form.new(dashboard, cup),
        }
    end
  end
end
