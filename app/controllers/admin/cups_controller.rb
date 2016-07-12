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

        if cup.league.cups.count >= 1
            cup = Cup.new(cup.league.cups.first.attributes)
            cup.day = nil 
            cup.price_options.each do |po|
                po.id = nil
            end
            cup.prize_options.each do |po|
                po.id = nil
            end
            flash[:alert] = "Asegúrese de cambiar los atributos que cambian entre las copas. Si todo lo demás es igual, está listo."
        end
        render locals: {
            page: Administrate::Page::Form.new(dashboard, cup),
        }
    end
  end
end
