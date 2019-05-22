class GoodsController < ApplicationController
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
    
    current_user.good(@shop)
    flash[:success] = 'カフェを「はかどった」に登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    current_user.ungood(@shop) 
    flash[:success] = 'カフェの「はかどった」を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
