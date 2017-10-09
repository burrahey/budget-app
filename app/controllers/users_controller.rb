class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/users/summary'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to '/purchases'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/users/summary'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/users/summary'
    else
      redirect to '/login'
    end
  end

  get "/logout" do
    session.clear
    redirect to "/login"
  end

  get "/users/summary" do
    erb :'/users/summary'
  end

end
