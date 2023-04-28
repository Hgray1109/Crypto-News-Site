class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Get news Data
    @url = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

    # Get Price Data

    @prices_url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,USDT,XRP,USDC,BNB,ARB,DOGE,BUSD,SOL&tsyms=USD"
    @prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices = JSON.parse(@prices_response)

  end

  def prices
    require 'net/http'
    require 'json'

    @symbol = params[:sym]
    if @symbol
     @symbol = @symbol.upcase

     @coin_url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{@symbol}&tsyms=USD"
     @coin_uri = URI(@coin_url)
     @coin_response = Net::HTTP.get(@coin_uri)
     @coin = JSON.parse(@coin_response)
    end
 

    
  end

end
