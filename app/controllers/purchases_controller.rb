class PurchasesController < ApplicationController
  get '/purchases' do
    @purchases = Purchase.all
    erb :'purchases/index'
  end
end
