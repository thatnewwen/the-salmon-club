class WelcomeController < ApplicationController
	def index
    redirect_to '/articles'
  end
end