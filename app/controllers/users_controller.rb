class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      flash[:message] = "You're already logged in - try signing out to create another account."
      redirect to '/summary'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to '/summary'
    else
      flash[:message] = "Sorry, that wasn't valid input. Try again"
      redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/summary'
    end
  end

  post '/login' do
    @user ||= User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/summary'
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  get "/logout" do
    session.clear
    flash[:message] = "Successfully logged out!"
    redirect to "/login"
  end

end
