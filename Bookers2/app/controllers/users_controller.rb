class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
    # @user = User.find(current_user.id)
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_pramas)
      redirect_to user_path(@user.id), notice: 'successfully'
    else
      render :edit
    end
  end

  private

  def user_pramas
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  before_action :ensure_correct_user, only:[:edit]

    def ensure_correct_user
    @user = User.find(params[:id])
     unless @user == current_user
     redirect_to user_path(current_user.id)
    end
  end
end
