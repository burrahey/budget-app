class PurchasesController < ApplicationController
  get '/purchases' do
    if logged_in?
      @purchases = Purchase.all
      erb :'purchases/index'
    else
      redirect to '/login'
    end
  end

  get '/purchases/new' do
    if logged_in?
      erb :'purchases/create'
    else
      redirect to '/login'
    end
  end

  post '/purchases' do
    if logged_in?
      @purchase = Purchase.new(params)
      @purchase.user = current_user
      if @purchase.save
        redirect to "/purchases/#{@purchase.id}"
      else
        redirect to "/purchases/new"
      end
    else
      redirect to '/login'
    end
  end

  get '/purchases/:id' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      erb :'purchases/show'
    else
      redirect to '/login'
    end
  end

  get '/purchases/:id/edit' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      erb :"purchases/edit"
    else
      redirect to '/login'
    end
  end

  patch '/purchases/:id' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      @purchase.description = params[:description]
      @purchase.amount = params[:amount]
      @purchase.date_purchased = params[:date_purchased]
      @purchase.save

      redirect to "/purchases/#{@purchase.id}"
    else
      redirect to '/login'
    end
  end

  delete '/purchases/:id/delete' do
    if logged_in?
      @purchase = Purchase.find(params[:id])
      if @purchase.destroy
        redirect to "/purchases"
      else
        redirect to "/purchases/#{@purchase.id}"
      end
    else
      redirect to '/login'
    end
  end
end
