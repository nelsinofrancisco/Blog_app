class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.includes(:user).where(author_id: @user.id)
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def edit
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :photo, :posts_counter, :email, :password)
  end
end
