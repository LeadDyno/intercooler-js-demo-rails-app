class LazyController < ApplicationController

  def index
    if params[:img]
      sleep(.5)
      image = Google::Search::Image.new(:query => 'FJ40').to_a[params[:img].to_i]
      render inline: "<img src='#{image.uri}' width='100%'>"
    end
  end

end