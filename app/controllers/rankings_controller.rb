class RankingsController < ApplicationController
  def good
    @ranking_counts = Good.ranking
    @shops = Shop.find(@ranking_counts.keys)
  end
  
  def want
    @ranking_counts = Want.ranking
    @shops = Shop.find(@ranking_counts.keys)
  end
end
