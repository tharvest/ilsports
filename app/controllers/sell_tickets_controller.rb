class SellTicketsController < ApplicationController
  def home
		@games = Game.all
  end
  
	def game
		@pools = Pool.where game_id: params[:id]
    @game = Game.find params[:id]
	end
 

end
