class BookCommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
  	comment = BookComment.new(book_comment_params)
    @book = Book.find(params[:book_id])
    comment.user_id = current_user.id
    comment.book_id = @book.id
    # logger.debug('ここ見る')
    # logger.debug(comment.inspect)
    comment.save
  	redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = BookComment.find(params[:comment_id])
    # binding.pry
    comment.destroy
    redirect_to book_path(@book)
  end

  private
  def book_comment_params
  	params.require(:book_comment).permit(:comment, :book_id)
  end
end
