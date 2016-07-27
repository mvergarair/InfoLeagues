class CommentsController < ApplicationController

	def create
		comment = Comment.new
		comment.user = current_user
		comment.resource_type = params[:comment][:resource_type]
		comment.resource_id = params[:comment][:resource_id]
		comment.text = params[:comment][:text]
		if comment.save
			render json: {
                status: 200, 
            }
		else
			render json: {status: 400}
		end
	end

	private

	def comment_params
      params.require(:comment).permit(:text, :resource_id, :resource_type,)
    end
end
