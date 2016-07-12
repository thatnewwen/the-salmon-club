class SessionsController < ApplicationController

	def new
	end

	def create
	  @user = User.find_by(username: user_params[:username])
    p @user
	  if @user && @user.authenticate(user_params[:password])
	      session[:user_id] = @user.id
	      redirect_to root_path
	  else
	    @errors = ["Invalid username or password"]
	    render 'new'
	  end
	end

	def destroy
	  session.delete(:user_id)
	  redirect_to '/'
	end

	private
	  def user_params
	    params.require(:session).permit(:username, :password)
	  end
end