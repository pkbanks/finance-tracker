class Stock < ApplicationRecord
	
	def self.find_by_ticker(ticker_symbol)
		where(ticker:ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.json_quote(ticker_symbol)
		return nil unless looked_up_stock["name"]
		new_stock = new(ticker: looked_up_stock["symbol"], name: looked_up_stock["name"])
		new_stock.last_price = new_stock.price
		return new_stock
	end

	def price
		closing_price = StockQuote::Stock.json_quote(ticker)["l"]
		return closing_price if closing_price
		return "Unavailable"
	end
end
