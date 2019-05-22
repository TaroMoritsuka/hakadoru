class ToppagesController < ApplicationController
  def index
    @prefectures = Prefecture.pluck(:id, :pref_name)
    @prefectures.unshift [0, 'すべて']
    @shops = Shop.order('updated_at DESC')
  end
end
