class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p params["user"]["access_code"]
    if (params["user"]["access_code"] == "salmon")
      if @user.save
        redirect_to login_path
      else
        @errors = @user.errors.full_messages
        render "users/new"
      end
    elsif (params["user"]["access_code"] == "admin")
      @user.admin = true
      if @user.save
        redirect_to login_path
      else
        @errors = @user.errors.full_messages
        render "users/new"
      end
    else
      @errors = @user.errors.full_messages
      render "users/new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
  
end