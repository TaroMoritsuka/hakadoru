class WantsController < ApplicationController
  def create
    @shop = Shop.find_or_initialize_by(shop_id: params[:shop_id])
    
    unless @shop.persisted?
      @shop.name = params[:name]
      @shop.name_kana = params[:name_kana]
      @shop.url = params[:url]
      @shop.url_mobile = params[:url_mobile]
      @shop.image_url = params[:image_url]
      @shop.address = params[:address]
      @shop.tel = params[:tel]
      @shop.opentime = params[:opentime]
      @shop.holiday = params[:holiday]
      @shop.save
      
    end
    
    
    current_user.want(@shop)
    flash[:success] = 'カフェを「行ってみたい」に登録しました。'
    redirect_back(fallback_location: root_path)
  
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    current_user.unwant(@shop) 
    flash[:success] = 'カフェの「行ってみたい」を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
