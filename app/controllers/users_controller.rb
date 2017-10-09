class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/summary'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to '/summary'
    else
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
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/summary'
    else
      redirect to '/login'
    end
  end

  get "/logout" do
    session.clear
    redirect to "/login"
  end

  get "/summary" do
    if logged_in?
      @user = current_user
      @sum = 0
      @user.purchases.each{|purchase| @sum+= purchase.amount}
      erb :summary
    else
      redirect to '/login'
    end
  end

end
