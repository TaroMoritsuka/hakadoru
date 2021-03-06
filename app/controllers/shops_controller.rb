class ShopsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
   
    @shops = []
    @pref_name = params[:pref_name]
    pref = Prefecture.find_by(pref_name: @pref_name) 
    require 'open-uri'
    require 'net/https'
    require 'json'
    word = "カフェ"
    data={
      "keyid": "f9c89128831e35feff63a3472f90a7fc",
      "pref": pref.pref_code,
      "freeword": word,
      "outret": 1,
      "wifi": 1,
      "hit_per_page": 100,
    }
    query=data.to_query
    uri = URI("https://api.gnavi.co.jp/RestSearchAPI/v3/?"+query)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    results = JSON.parse(res.body) 
    results['rest'].each do |result|
      shop = Shop.find_or_initialize_by(read(result))
      @shops << shop
    end
  end
  
  
  private
  
  def read(result)
    shop_id = result['id']
    name = result['name']
    name_kana = result['name_kana']
    url = result['url']
    url_mobile = result['url_mobile']
    image_url = result['image_url']['shop_image1']
    address = result['address']
    tel = result['tel']
    opentime = result['opentime']
    holiday = result['holiday']

    {
      shop_id: shop_id,
      name: name,
      name_kana: name_kana,
      url: url,
      url_mobile: url_mobile,
      image_url: image_url,
      address: address,
      tel: tel,
      opentime: opentime,
      holiday: holiday,
    }
  end
 
end
