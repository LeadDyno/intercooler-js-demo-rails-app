class LazyController < ApplicationController

  def index
    if params[:url]
      sleep(1.3)
      render inline: "<img src='#{params[:url]}' width='100%'>"
    else
      @images = Google::Search::Image.new(:query => 'FJ40').to_a[1..9]
    end
  end

end