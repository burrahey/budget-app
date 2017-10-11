class PurchasesController < ApplicationController
  get '/purchases' do
    if logged_in?
      @purchases ||= Purchase.all.order(date_purchased: :desc)
      erb :'purchases/index'
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  get '/purchases/new' do
    if logged_in?
      erb :'purchases/create'
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  get '/purchases/delete' do
    if logged_in?
      Purchase.destroy_all(:user_id => current_user.id)
      redirect to '/summary'
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  post '/purchases' do
    if logged_in?
      @purchase = Purchase.new(params)
      @purchase.user_id = current_user.id
      if @purchase.save
        flash[:message] = "Successfully recorded purchase."
        redirect to "/purchases/#{@purchase.id}"
      else
        flash[:message] = "Oops, couldn't save that purchase. @purchase.errors Try again!"
        redirect to "/purchases/new"
      end
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  get '/purchases/:id' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      erb :'purchases/show'
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  get '/purchases/:id/edit' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      if @purchase.user.id == current_user.id
        erb :"purchases/edit"
      else
        redirect to "/purchases/#{@purchase.id}"
      end
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  patch '/purchases/:id' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      @purchase.description = params[:description]
      @purchase.amount = params[:amount]
      @purchase.date_purchased = params[:date_purchased]
      if @purchase.save
        flash[:message] = "Successfully edited purchase."
        redirect to "/purchases/#{@purchase.id}"
      else
        flash[:message] = "Sorry, that wasn't valid entry. Try again."
        redirect to "/purchases/#{@purchase.id}/edit"
      end
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

  delete '/purchases/:id/delete' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      if @purchase.destroy
        flash[:message] = "Successfully destroyed record of purchase"
        redirect to "/summary"
      else
        flash[:message] = "Couldn't delete purchase"
        redirect to "/purchases/#{@purchase.id}"
      end
    else
      flash[:message] = "You must log in first!"
      redirect to '/login'
    end
  end

end
