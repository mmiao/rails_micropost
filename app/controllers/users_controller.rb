class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #render 'show'
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  	#@user = User.find(params[:email]) why this does work?
  end

  private # private keyword doesn't end, make sure no public method after it

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
