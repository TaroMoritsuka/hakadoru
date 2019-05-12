class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
     redirect_to login_url
    end
  end
  
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
