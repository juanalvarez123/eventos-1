class SigninsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(requestAttributes)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  private def requestAttributes
    params.require(:user).permit(:name, :email, :password)
  end
end