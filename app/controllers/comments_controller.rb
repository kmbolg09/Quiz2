class CommentsController < ApplicationController
  resources :ideas, only: [:new, :index, :create, :show, :edit, :destroy] do 
    resources :comments 
  end
def create 
  @comment = @idea.comments.new(comment_attributes)
  @comment.user = current_user

  #@comment = Comment.new(params[:comment])
  #@idea = Idea.find params[:user_id]
  #@comment = @idea.comment.new(comment_attributes)
 if @comment.save
 redirect_to "/", notice: "Comment added!"
 else 
 render "/ideas/show" 

end
end

private
def comment_attributes
  params.require(:comment).permit([:body])
end

end
