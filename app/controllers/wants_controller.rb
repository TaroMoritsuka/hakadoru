class WantsController < ApplicationController
  def create
    @shop = Shop.find_or_initialize_by(shop_id: params[:shop_id])
      
    unless @shop.persisted?
    
    require 'open-uri'
    require 'net/https'
    require 'json'
    data={
      "keyid": "f9c89128831e35feff63a3472f90a7fc",
      "id": @shop.shop_id,
    }
    query=data.to_query
    uri = URI("https://api.gnavi.co.jp/RestSearchAPI/v3/?"+query)

    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    results = JSON.parse(res.body)
      results['rest'].each do |result|
        @shop = Shop.new(read(results.first))
        @shop.save
      end
    end

    current_user.want(@shop)
    flash[:success] = 'このカフェを「行ってみたい」に登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    current_user.unwant(@shop) 
    flash[:success] = 'カフェの「行ってみたい」を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
