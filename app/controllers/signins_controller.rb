class SigninsController < ApplicationController
  def new

  end

  def create
    @user = User.new(requestAttributes)
    @user.save
    redirect_to login_path
  end

  private def requestAttributes
    params.require(:user).permit(:name, :email, :password)
  end
end