class PurchasesController < ApplicationController
  get '/purchases' do
    authenticate_user
    @purchases = Purchase.all.order(date_purchased: :desc)
    erb :'purchases/index'
  end

  get '/purchases/new' do
    authenticate_user
    erb :'purchases/create'
  end

  delete '/purchases' do
    authenticate_user
    current_user.purchases.destroy_all
    redirect to '/summary'
  end

  post '/purchases' do
    authenticate_user
    @purchase = current_user.purchases.build(params)
    if @purchase.save
      flash[:message] = "Successfully recorded purchase."
      redirect to "/purchases/#{@purchase.id}"
    else
      flash[:message] = "Oops, couldn't save that purchase. Try again!"
      redirect to "/purchases/new"
    end
  end

  get '/purchases/:id' do
    authenticate_user
    if @purchase = Purchase.find_by(id: params[:id])
      erb :'purchases/show'
    else
      flash[:message] = "Sorry that Purchase doesn't exist"
      redirect to '/summary'
    end
  end

  get '/purchases/:id/edit' do
    authenticate_user
    @purchase = Purchase.find_by(id: params[:id])
    if @purchase && @purchase.user == current_user
      erb :"purchases/edit"
    elsif @purchase && @purchase.user != current_user
      redirect to "/purchases/#{@purchase.id}"
    else
      flash[:message] = "Sorry that Purchase doesn't exist"
      redirect to "/summary"
    end
  end

  patch '/purchases/:id' do
    authenticate_user
    @purchase = Purchase.find_by(params[:id])
    if @purchase && @purchase.user == current_user
      if @purchase.update(params[:purchase])
        flash[:message] = "Successfully edited purchase."
        redirect to "/purchases/#{@purchase.id}"
      else
        flash[:message] = "Sorry, that wasn't valid entry. Try again."
        redirect to "/purchases/#{@purchase.id}/edit"
      end
    elsif @purchase && @purchase.user != current_user
      redirect to "/purchases/#{@purchase.id}"
    else
      flash[:message] = "Sorry that Purchase doesn't exist"
      redirect to "/summary"
    end
  end

  delete '/purchases/:id' do
    authenticate_user
    @purchase = Purchase.find_by(params[:id])
    if @purchase && @purchase.user == current_user
      if @purchase.destroy
        flash[:message] = "Successfully destroyed record of purchase"
        redirect to "/summary"
      else
        flash[:message] = "Couldn't delete purchase"
        redirect to "/purchases/#{@purchase.id}"
      end
    elsif @purchase && @purchase.user != current_user
      redirect to "/purchases/#{@purchase.id}"
    else
      flash[:message] = "Sorry that Purchase doesn't exist"
      redirect to "/summary"
    end
  end
end
