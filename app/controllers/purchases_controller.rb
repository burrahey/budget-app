class PurchasesController < ApplicationController
  get '/purchases' do
    @purchases = Purchase.all
    erb :'purchases/index'
  end

  get '/purchases/new' do
    erb :'purchases/create'
  end

  post '/purchases' do
    @purchase = Purchase.new(params)
    @purchase.user = current_user
    if @purchase.save
      redirect to "/purchases/#{@purchase.id}"
    else
      redirect to "/purchases/new"
    end
  end

  get '/purchases/:id' do
    @purchase = Purchase.find(params[:id])
    erb :'purchases/show'
  end

  get '/purchases/:id/edit' do
    @purchase = Purchase.find(params[:id])
    erb :"purchases/edit"
  end

  patch '/purchases/:id' do
    @purchase = Purchase.update(params)
    redirect to "/purchases/#{@purchase.id}"
  end

  delete '/purchases/:id/delete' do

  end

end
