class DeliveryProvidersController < ApplicationController

  def new
    @delivery_provider = DeliveryProvider.new
  end

  def create
    @delivery_provider = DeliveryProvider.new(delivery_provider_params)
    if @delivery_provider.save
      flash[:success] = '配送業者登録完了しました！'
      redirect_to delivery_provider_path(@delivery_provider)
    else
      render 'new'
    end
  end

  def show
    @delivery_provider = DeliveryProvider.find(params[:id])
  end

  def edit
    @delivery_provider = DeliveryProvider.find(params[:id])
  end

  def update
    @delivery_provider = DeliveryProvider.find(params[:id])
    if @delivery_provider.update_attributes(delivery_provider_params)
      flash[:success] = 'デリバリー業者情報が更新されました！'
      redirect_to @delivery_provider
    else
      render 'edit'
    end
  end

  def destroy
    @delivery_provider = DeliveryProvider.find(params[:id])
    if 
      @delivery_provider.destroy
      flash[:success] = 'デリバリー業者が削除されました'
      redirect_to request.referrer || root_url
    else
      flash[:denger] = '権限がない方は削除できません'
      redirect_to root_url
    end
  end

  def index
    @delivery_provider = DeliveryProvider.all
  end

  private

  def delivery_provider_params
    params.require(:delivery_provider).permit(:name, :url)
  end
end
