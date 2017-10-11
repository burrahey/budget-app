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
      @user ||= current_user
      @total_sum ||= Purchase.total_sum(@user)
      @monthly_sum ||= Purchase.monthly_sum(@user)
      erb :summary
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
