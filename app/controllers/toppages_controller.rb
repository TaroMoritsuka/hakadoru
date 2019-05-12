class ToppagesController < ApplicationController
  def index
    @prefectures = Prefecture.pluck(:id, :pref_name)
    @prefectures.unshift [0, 'すべて']
  end
end
