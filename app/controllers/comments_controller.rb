class CommentsController < ApplicationController
  belongs_to :comment
  belongs_to :report
  belongs_to :user

  def new
    @comment = Comment.new
    @shops = Shop.all
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントが投稿されました"
      #users/@user.idにとばせるようにする
      redirect_to comment_path(@comment)
    else
      render 'comments/new'
    end
  end

  def show
    @shop =  Shop.find(params[:id])
    @comment = @shop.comments.title(page: params[:page], per_page: 5)
  end

  private

    def comment_params
      params.require(:comment).permit(:title, :comment)
    end
end

