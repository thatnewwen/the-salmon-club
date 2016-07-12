module ApplicationHelper
	def current_user
	  @_cached_user ||= User.find(session[:user_id]) if logged_in?
	end

	def admin?
	  if logged_in?
		  User.find(session[:user_id]).admin == true
    else
    	false
		end
	end

	def logged_in?
	  session[:user_id] != nil
	end

	def authorize!
	  redirect_to login_path unless logged_in?
	end

	def redirect_unless_self(id)
	  redirect_to root_path unless current_user.id == id
	end

	def author_logged_in?(question)
	  if logged_in?
	    current_user.id == question.author.id
	  end
	end
end
