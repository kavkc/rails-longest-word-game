class GamesController < ApplicationController
  def new
    # raise
    @letters = ('a'..'z').to_a.sample(10).join(' ')
  end

  def score
    # raise
    @word = params[:word]
    require 'open-uri'
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    raw = URI.open(url).read
    result = JSON.parse(raw)
    input_arr = @word.split('')
    letters_arr = params[:letters].split(' ')
    check = input_arr - letters_arr
    if check.any?
      @response = "Sorry but #{@word} can't be built out of #{params[:letters]}"
    # raise
    elsif result["found"] == true
      @response = "Congratulations! #{@word} is a valid English word"
    elsif result["found"] == false
      @response = "Sorry but #{@word} does not seem to be a valid English word.."
    end
  end
end
