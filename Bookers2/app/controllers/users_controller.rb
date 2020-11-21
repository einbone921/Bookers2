class UsersController < ApplicationController

  def index
    @user = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @user = User.find(current_user.id)
    if @book.save
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      @books = Book.all
      render :index
    end
  end

  def edit
  end

  def destroy
  end

  private

  def user_pramas
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
