require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  set :session_secret, "app_security"
  use Rack::Flash

  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get "/summary" do
    if logged_in?
      @total_sum = Purchase.total_sum(current_user)
      @monthly_sum = Purchase.monthly_sum(current_user)
      erb :summary
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  private

    def authenticate_user
      # redirect to login with error message if not logged in
      if !logged_in?
        flash[:message] = "You must log in first!"
        redirect to '/login'
      end
    end

end
