class StocksController < ApplicationController
	def search
		if params[:stock]
			@stock = Stock.find_by_ticker(params[:stock])
			# if the stock doesn't yet exist in
			# our database, then get it from the api
			@stock ||= Stock.new_from_lookup(params[:stock])
		end

		if @stock
			# render json: @stock
			render partial: 'lookup'
		else
			head :ok
		end
	end
end